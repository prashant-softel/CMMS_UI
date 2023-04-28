// coverage:ignore-file

import 'dart:convert';
import 'dart:io' show Directory, File, FileMode;
import 'dart:math';

import 'package:cmms/app/app.dart';
import 'package:cmms/domain/domain.dart';
import 'package:dio/dio.dart' as dio;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' show Placemark, GeocodingPlatform;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class Utility {
  static Directory path = Directory('storage/emulated/0/Fanzly');

  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(dynamic message) {
    Logger().i('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Get First word of a name.
  ///
  static String? getNameInitials(String? firstName, String? lastName) =>
      '${firstName![0]}${lastName![0]}'.toUpperCase();

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName}: $message');
  }

  /// Returns a error String by validating password.
  ///
  /// for at least one upper case, at least one digit,
  /// at least one special character and and at least 6 characters long
  /// return [List<bool>] for each case.
  /// Validation logic
  /// r'^
  ///   (?=.*[A-Z])             // should contain at least one upper case
  ///   (?=.*?[0-9])            // should contain at least one digit
  ///  (?=.*?[!@#\$&*~]).{8,}   // should contain at least one Special character
  /// $
  static String? validatePassword(String value) {
    if (value.trim().isNotEmpty) {
      // if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      // if (value.contains(RegExp(r'[A-Z]'))) {
      // if (value.contains(RegExp(r'[0-9]'))) {
      if (value.length < 3) {
        return 'shouldBe3Characters'.tr;
      } else {
        return null;
      }
      // } else {
      //   return 'Keep your account secure – include a digit.';
      // }
      // } else {
      //   return 'Keep your account secure – include an uppercase letter.';
      // }
      // } else {
      //   return 'Keep your account secure – include a special character.';
      // }
    } else {
      return 'passwordRequired'.tr;
    }
  }

  /// Returns true if email is Valid
  static bool emailValidator(String email) => EmailValidator.validate(email);

  /// Check if URL is valid
  static bool urlValidator(String value) {
    var pattern =
        r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Print the details of the [response].
  static void printResponseDetails(Response? response) {
    if (response != null) {
      var isOkay = response.isOk;
      var statusCode = response.statusCode;
      var statusText = response.statusText;
      var method = response.request?.method ?? '';
      var path = response.request?.url.path ?? '';
      var query = response.request?.url.queryParameters ?? '';
      if (isOkay) {
        printILog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      } else {
        printELog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      }
    }
  }

  /// returns the date time in particular given formate
  static String getWeekDayMonthNumYear(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);
  static String getFormatedyearMonthDay(String datetime) {
    var date = DateTime.parse(datetime);
    return Utility.getyearMonthDay(date);
  }

  static String getyearMonthDay(DateTime dateTime) =>
      // '${getOnlyDate(dateTime)}-${DateFormat('MM').format(dateTime)}-${DateFormat.y().format(dateTime)}';
      DateFormat('yyyy-MM-dd').format(dateTime);

  /// get formated [DateTime] eg. 12-01-2021
  static String getDayMonthYear(DateTime dateTime) =>
      '${getOnlyDate(dateTime)}-${DateFormat('MM').format(dateTime)}-${DateFormat.y().format(dateTime)}';

  /// get formated [DateTime] eg. 12
  static String getOnlyDate(DateTime dateTime) =>
      DateFormat('dd').format(dateTime);

  /// get formated [DateTime] eg. 12 Sep
  static String getDateAndMonth(DateTime dateTime) =>
      DateFormat('dd MMM').format(dateTime);

  /// get formated [DateTime]
  static String getWeekDay(DateTime dateTime) =>
      DateFormat.EEEE().format(dateTime);

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int _numOfWeeks(int year) {
    var dec28 = DateTime(year, 12, 28);
    var dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  // Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    var dayOfYear = int.parse(DateFormat('D').format(date));
    var woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  /// Show loader
  static void showLoader() async {
    await Get.dialog<dynamic>(
      Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.white,
          size: 60,
        ),
      ),
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(.7),
    );
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  /// URL Launcher
  static void launchURL(String _url) async =>
      await canLaunchUrl(Uri.parse(_url))
          ? await canLaunchUrl(Uri.parse(_url))
          : showDialog('Could not open $_url');

  /// Show info dialog
  static void showDialog(
    String message, {
    Function()? onPress,
    bool barrierDismissible = true,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoButton(
            onPressed: onPress ?? Get.back,
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    // if (Get.isDialogOpen ?? false) Get.back<dynamic>();
    debugPrint('Start: Close Dialog ${Get.isDialogOpen}');
    if (Get.isDialogOpen ?? true) {
      //   // Navigator.of(Get.context!, rootNavigator: true);
      Get.back<void>();
    }
    debugPrint('End: Close Dialog ${Get.isDialogOpen}');
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back<void>();
    }
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static Future<void> showNoInternetDialog() async {
    await Get.dialog<void>(
      const NoInternetWidget(),
      barrierDismissible: false,
    );
  }

  /// Show a message to the user.
  ///
  /// [message] : Message you need to show to the user.
  // ignore: comment_references
  /// [messageType] : Type of the message for different background color.
  // ignore: comment_references
  /// [onTap] : An event for onTap.
  // ignore: comment_references
  /// [actionName] : The name for the action.
  static void showMessage(String? message, MessageType messageType,
      Function()? onTap, String actionName) {
    if (message == null || message.isEmpty) return;
    closeDialog();
    closeSnackbar();
    var backgroundColor = Colors.black;
    switch (messageType) {
      case MessageType.error:
        backgroundColor = Colors.red;
        break;
      case MessageType.information:
        backgroundColor = Colors.black.withOpacity(0.3);
        break;
      case MessageType.success:
        backgroundColor = Colors.green;
        break;
      default:
        backgroundColor = Colors.black;
        break;
    }
    Future.delayed(
      const Duration(seconds: 0),
      () {
        Get.rawSnackbar(
          messageText: Text(
            '${jsonDecode(message)['message']}',
            style: const TextStyle(color: Colors.white),
          ),
          mainButton: TextButton(
            onPressed: onTap ?? Get.back,
            child: Text(
              actionName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: backgroundColor,
          margin: const EdgeInsets.all(15.0),
          borderRadius: 15,
          snackStyle: SnackStyle.FLOATING,
        );
      },
    );
  }

  /// Returns Platform type
  static String platFormType() {
    var value = kIsWeb
        ? 3
        : GetPlatform.isAndroid
            ? 1
            : 2;
    return value.toString();
  }

  /// Random number generator
  static int getRandomNumer() {
    var random = Random();
    return random.nextInt(100);
  }

  /// Return file size
  static String getFileSize(int size) {
    if (size == 0) {
      return '0 KB';
    } else {
      var val = size / pow(1024, (log(size) / log(1024)).floor());
      if (size < 1024) {
        return '$val KB';
      } else {
        return '${val.toStringAsFixed(1)} MB';
      }
    }
  }

  /// Get current lat long of the device.
  static Future<Position> getCurrentLatLng() async =>
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

  /// Get the location name by giving the lat long.
  ///
  /// [latitude] : latitude of the location.
  /// [longitude] : longitude of the location.
  static Future<Placemark?> getAddressThroughLatLng(
      double? latitude, double? longitude) async {
    if (latitude != null && longitude != null) {
      var addresses = await GeocodingPlatform.instance.placemarkFromCoordinates(
        latitude,
        longitude,
      );
      return addresses[0];
    } else {
      return null;
    }
  }

  static String getFormatedDate(String datetime) {
    var date = DateTime.parse(datetime);
    return Utility.getDayMonthYear(date);
  }

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      [bool isSuccess = false]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['message'] as String,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Get.back,
            isDefaultAction: true,
            child: Text(
              'okay'.tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Bottomsheet to show only alerts to user.
  static void showInfoBottomSheet({
    required String icon,
    required String title,
    required String coloredTitle,
    String? description,
    double? titleSize,
    String? subTitle,
    double? subTitleSize,
    Widget? actions,
    Function()? onPress,
    bool isdismissible = true,
    Axis direction = Axis.vertical,
    double? fontSize,
    bool defaultSpaceBetweenColoredText = false,
  }) =>
      Get.bottomSheet<void>(
        Container(
          padding: Dimens.edgeInsets16,
          decoration: BoxDecoration(
            color: Theme.of(Get.context!).canvasColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Dimens.fourteen,
              ),
              topRight: Radius.circular(
                Dimens.fourteen,
              ),
            ),
          ),
          child: Container(
            margin: Dimens.edgeInsets0_20_0_0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (subTitle != null)
                  Text(
                    subTitle,
                    style: Styles.blackBold16,
                  ),
                if (description != null)
                  Text(
                    description,
                    style: Styles.black12.copyWith(
                      color: Theme.of(Get.context!).hintColor,
                    ),
                  ),
                if (actions == null) Dimens.boxHeight40,
                if (actions != null) actions,
                if (actions == null)

                  // else
                  //   actions,
                  Dimens.boxHeight10,
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Theme.of(Get.context!).canvasColor,
        isDismissible: isdismissible,
        enableDrag: isdismissible,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      );

  // /// Bottomsheet to show only alerts to user.
  // static void showAlertBottomSheet({
  //   String? title,
  //   Function()? onCancle,
  //   Function()? onConfirm,
  //   String? cancleCustomText,
  //   String? confirmCustomText,
  // }) =>
  //     Get.bottomSheet<void>(
  //       Container(
  //         color: isThemeDarkMode()
  //             ? Theme.of(Get.context!).canvasColor
  //             : ColorValues.whiteColor,
  //         padding: Dimens.edgeInsets35,
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               title ?? 'areYouSure'.tr,
  //               style: Styles.blackBold26,
  //             ),
  //             Dimens.boxHeight20,
  //             Row(
  //               children: [
  //                 Expanded(
  //                   child: PrimaryButton(
  //                     margin: Dimens.edgeInsets0_16_0_16,
  //                     style: Styles.cancleElevatedButtonTheme,
  //                     title: confirmCustomText ?? 'confirm'.tr,
  //                     onPress: onConfirm,
  //                     padding: Dimens.edgeInsets0,
  //                   ),
  //                 ),
  //                 Dimens.boxWidth10,
  //                 Expanded(
  //                   child: PrimaryButton(
  //                     margin: Dimens.edgeInsets0,
  //                     title: cancleCustomText ?? 'cancle'.tr,
  //                     onPress: onCancle,
  //                     padding: Dimens.edgeInsets0,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //       isScrollControlled: true,
  //       backgroundColor: Theme.of(Get.context!).canvasColor,
  //     );

  static String imageOptimization({
    required String bucket,
    required String url,
    required num width,
    required num height,
    required int quality,
    bool progressive = true,
    bool mozjpeg = true,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$url","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$url","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static String imageOptimizationWithoutSize({
    required String bucket,
    required String key,
    required int quality,
    required bool progressive,
    required bool mozjpeg,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static Future<String> createFolder() async {
    var permissionGranted = false;
    if (await Permission.storage.request().isGranted) {
      permissionGranted = true;
      await Permission.manageExternalStorage.request();
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      permissionGranted = false;
    }
    printILog(permissionGranted);
    if (GetPlatform.isIOS) {
      var iosPath = await getApplicationDocumentsDirectory();
      var donwloadDirectory = Directory('${iosPath.path}/Fanzly');
      if (await donwloadDirectory.exists()) {
        return donwloadDirectory.path;
      } else {
        await donwloadDirectory.create();
        return donwloadDirectory.path;
      }
    } else {
      if (await path.exists()) {
        return path.path;
      } else {
        await path.create();
        return path.path;
      }
    }
  }

  /// Download file into private folder
  static Future<void> downloadFile(String? url, String? name) async {
    Get.back<dynamic>();
    Utility.showLoader();
    final appStorage = await createFolder();
    final extension = ".${url!.split('.').last}";
    final file = File('$appStorage/${name!}');

    printILog(extension);
    printDLog(file.path);
    printDLog(url);

    try {
      var progress = '';
      final response = await dio.Dio().get<dynamic>(
        url,
        options: dio.Options(
            responseType: dio.ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0),
        onReceiveProgress: (rec, total) {
          progress = '${((rec / total) * 100).round()}%';
          debugPrint(progress);
        },
      );

      if (GetPlatform.isIOS) {
        dynamic result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data as List<int>),
            quality: 60,
            name: name);
        printILog(result);
      } else {
        final d = response.data as List<int>;

        final ref = file.openSync(mode: FileMode.write);

        ref.writeFromSync(d);
        await ref.close();
      }

      Utility.closeDialog();
    } on Exception {
      Utility.closeDialog();
      printELog('Download Error');
      return null;
    }
  }

  static void getReadMoreSheet({String? title, String? text}) {
    Get.bottomSheet<dynamic>(
      SafeArea(
        child: Container(
          height: Dimens.twoHundredEighty,
          constraints: const BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          color: ColorValues.greyColor,
          child: Padding(
            padding: Dimens.edgeInsets15_20_15_0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.white23,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back<void>();
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight30,
                  Text(
                    text!,
                    style: Styles.white14,
                  ),
                  Dimens.boxHeight10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static bool isThemeDarkMode() {
    var repository = Get.find<Repository>();
    var themeMode = repository.getStoredValue(LocalKeys.isThemeDarkMode);
    return themeMode;
  }

  /// Price Format.
  ///
  static String priceFormat(String amount) =>
      NumberFormat('#,##,###.##', 'en_US').format(num.tryParse(amount) ?? 0);

  static String getStyledHtml(String content) {
    if (content.contains('rgb')) {
      debugPrint('contains======== true');
      var repository = Get.find<Repository>();
      var themeMode = repository.getStoredValue(LocalKeys.isThemeDarkMode);
      if (themeMode) {
        return content.replaceAll('<span style=\"color: rgb(44, 53, 60);\">',
            '<span style=\"color: rgb(255, 255, 255);\">');
      } else {
        return content;
      }
    } else {
      debugPrint('contains========== false');
      return content;
    }
  }

  /// Compare password & confirm password.
  ///
  static bool comparePasswords(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    return false;
  }

  /// Show Error bottomsheet.
  ///
  static void showErrorBottomSheet({
    required String? message,
    Function()? onPress,
    bool isDismissible = true,
    bool autoDismiss = true,
  }) async {
    await Get.bottomSheet<void>(
      Container(
        padding: Dimens.edgeInsets30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$message',
              style: Styles.blackBold16.copyWith(
                color: const Color.fromRGBO(235, 87, 87, 1),
              ),
            ),
            Dimens.boxHeight10,
            // CustomButton(
            //   width: Get.width - Dimens.sixty,
            //   onPress: onPress ?? Get.back,
            //   height: 50,
            //   title: 'ok'.tr,
            //   color: const Color.fromRGBO(235, 87, 87, 1),
            // ),
            // Dimens.boxHeight10,
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(255, 206, 206, 1),
      isScrollControlled: true,
      isDismissible: isDismissible,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
    ).timeout(const Duration(seconds: 4), onTimeout: () {
      if (autoDismiss) {
        if (Get.isBottomSheetOpen!) {
          Get.back<void>();
        }
      }
    });

    // Get.snackbar(
    //   '',
    //   'message',
    //   // messageText: Container(
    //   //   color: Colors.red,
    //   //   height: 100,
    //   //   width: 100,
    //   // ),
    //   // titleText: Container(
    //   //   color: Colors.red,
    //   //   height: 100,
    //   //   width: 100,
    //   // ),
    //   barBlur: 0,
    //   backgroundColor: Colors.red,

    //   margin: Dimens.edgeInsets0,
    //   padding: Dimens.edgeInsets0,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }
}
