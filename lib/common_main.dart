// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'dart:developer';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app_config.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> mainCommon(AppConfig appConfig) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // FlutterBranchSdk.validateSDKIntegration();
    await Firebase.initializeApp();

    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    appFlavor = (appConfig.flavoredApp == 2) ? AppFlavor.PROD : AppFlavor.DEV;
    await initServices();

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then(
      (value) => runApp(
        MediaQuery(
          data: MediaQueryData(
            size: Size(Get.width * 1, Get.height * 1),
          ),
          child: MyApp(
            appTitle: appConfig.appTitle!,
            themeMode: appConfig.themeMode!,
          ),
        ),
      ),
    );
    // if (!kIsWeb) {
    //   await FlutterDownloader.initialize(
    //       debug: true // optional: set false to disable loging logs to console
    //       );
    // }
  } catch (exception) {
    Utility.printELog(exception.toString());
  }
}

Future<void> initMixpanel() async {
  await Mixpanel.init(AppConstants.mixPannelId,
      optOutTrackingDefault: false, trackAutomaticEvents: true);
}

Future<void> initPlatformState() async {
  var oneSignalId = '';
  if (appFlavor == AppFlavor.PROD) {
    oneSignalId = '98077668-43ef-4d72-a9fe-7ea4feaeb176';
  } else {
    oneSignalId = '5776f0e0-eeb2-4e77-93a5-b0c9d921f800';
  }
  await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  await OneSignal.shared.setAppId(oneSignalId);
  await OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {
    log('############ NOTIFICATION $accepted');
  });

  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    // Will be called whenever a notification is received in foreground
    // Display Notification, pass null param for not displaying the notification
    event.complete(event.notification);
    log('############ NOTIFICATION FOREGROUND ${event.notification}');
  });

  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    // Will be called whenever a notification is opened/button pressed.
    log('############ NOTIFICATION OPENHANDLER ${result.notification}');
  });

  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    // Will be called whenever the permission changes
    // (ie. user taps Allow on the permission prompt in iOS)
    log('############ NOTIFICATION setPermissionObserver $changes');
  });

  OneSignal.shared
      .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
    // Will be called whenever the subscription changes
    // (ie. user gets registered with OneSignal and gets a user ID)
    log('############ NOTIFICATION setSubscriptionObserver $changes');
  });

  OneSignal.shared.setEmailSubscriptionObserver(
      (OSEmailSubscriptionStateChanges emailChanges) {
    // Will be called whenever then user's email subscription changes
    // (ie. OneSignal.setEmail(email)
//  is called and the user gets registered
    log('############ NOTIFICATION setEmailSubscriptionObserver $emailChanges');
  });
}

Future<void> initServices() async {
  await Hive.initFlutter();

  Hive.registerAdapter(DownloadTaskModelAdapter());

  await Hive.openBox<DownloadTaskModel>('download_task_model');

  Get.put(
    Repository(
      Get.put(
        DeviceRepository(),
        permanent: true,
      ),
      Get.put(
          DataRepository(
            Get.put(
              ConnectHelper(),
              permanent: true,
            ),
          ),
          permanent: true),
    ),
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
  await initPlatformState();
  await initMixpanel();
}

class DbService extends GetxService {
  Future<DbService> init() async {
    await Get.find<DeviceRepository>().init();
    return this;
  }
}

class MyApp extends StatefulWidget {
  MyApp({
    Key? key,
    this.appTitle,
    this.themeMode,
  }) : super(key: key);

  final String? appTitle;
  final ThemeMode? themeMode;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BranchContentMetaData metadata = BranchContentMetaData();
  BranchUniversalObject? buo;
  BranchLinkProperties lp = BranchLinkProperties();
  BranchEvent? eventStandart;
  BranchEvent? eventCustom;

  StreamController<String> controllerData = StreamController<String>();
  StreamController<String> controllerInitSession = StreamController<String>();

  void listenDynamicLinks() async {
    FlutterBranchSdk.initSession().listen((data) {
      log('listenDynamicLinks - DeepLink Data: $data');
      controllerData.sink.add(data.toString());
      if (data.containsKey('+clicked_branch_link') &&
          data['+clicked_branch_link'] == true) {
        log('------------------------------------Link clicked----------------------------------------------');
        log('Custom string: ${data['custom_string']}');
        log('Custom number: ${data['custom_number']}');
        log('Custom bool: ${data['custom_bool']}');
        log('Custom list number: ${data['custom_list_number']}');
        log('------------------------------------------------------------------------------------------------');
      }
    }, onError: (dynamic error) {
      log('InitSesseion error: ${error.toString()}');
    });
  }

  void initDeepLinkData() {
    metadata = BranchContentMetaData()
      ..addCustomMetadata('custom_string', 'abcd')
      ..addCustomMetadata('custom_number', 12345)
      ..addCustomMetadata('custom_bool', true)
      ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
      ..addCustomMetadata('custom_list_string', ['a', 'b', 'c'])
      //--optional Custom Metadata
      ..contentSchema = BranchContentSchema.COMMERCE_PRODUCT
      ..price = 50.99
      ..currencyType = BranchCurrencyType.BRL
      ..quantity = 50
      ..sku = 'sku'
      ..productName = 'productName'
      ..productBrand = 'productBrand'
      ..productCategory = BranchProductCategory.ELECTRONICS
      ..productVariant = 'productVariant'
      ..condition = BranchCondition.NEW
      ..rating = 100
      ..ratingAverage = 50
      ..ratingMax = 100
      ..ratingCount = 2
      ..setAddress(
          street: 'street',
          city: 'city',
          region: 'ES',
          country: 'Brazil',
          postalCode: '99999-987')
      ..setLocation(31.4521685, -114.7352207);

    buo = BranchUniversalObject(
        canonicalIdentifier: 'flutter/branch',
        //parameter canonicalUrl
        //If your content lives both on the web and in the app, make sure you set its canonical URL
        // (i.e. the URL of this piece of content on the web) when building any BUO.
        // By doing so, we’ll attribute clicks on the links that you generate back to their original web page,
        // even if the user goes to the app instead of your website! This will help your SEO efforts.
        canonicalUrl: 'https://flutter.dev',
        title: 'Flutter Branch Plugin',
        // imageUrl: imageURL,
        contentDescription: 'Flutter Branch Description',
        /*
        contentMetadata: BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'abc')
          ..addCustomMetadata('custom_number', 12345)
          ..addCustomMetadata('custom_bool', true)
          ..addCustomMetadata('custom_list_number', [1, 2, 3, 4, 5])
          ..addCustomMetadata('custom_list_string', ['a', 'b', 'c']),
         */
        contentMetadata: metadata,
        keywords: ['Plugin', 'Branch', 'Flutter'],
        publiclyIndex: true,
        locallyIndex: true,
        expirationDateInMilliSec: DateTime.now()
            .add(const Duration(days: 365))
            .millisecondsSinceEpoch);

    lp = BranchLinkProperties(
        channel: 'facebook',
        feature: 'sharing',
        //parameter alias
        //Instead of our standard encoded short url, you can specify the vanity alias.
        // For example, instead of a random string of characters/integers, you can set the vanity alias as *.app.link/devonaustin.
        // Aliases are enforced to be unique** and immutable per domain, and per link - they cannot be reused unless deleted.
        //alias: 'https://branch.io' //define link url,
        stage: 'new share',
        campaign: 'campaign',
        tags: ['one', 'two', 'three'])
      ..addControlParam('\$uri_redirect_mode', '1')
      ..addControlParam('\$ios_nativelink', true)
      ..addControlParam('\$match_duration', 7200)
      ..addControlParam('\$always_deeplink', true)
      ..addControlParam('\$android_redirect_timeout', 750)
      ..addControlParam('referring_user_id', 'user_id');

    eventStandart = BranchEvent.standardEvent(BranchStandardEvent.ADD_TO_CART)
      //--optional Event data
      ..transactionID = '12344555'
      ..currency = BranchCurrencyType.BRL
      ..revenue = 1.5
      ..shipping = 10.2
      ..tax = 12.3
      ..coupon = 'test_coupon'
      ..affiliation = 'test_affiliation'
      ..eventDescription = 'Event_description'
      ..searchQuery = 'item 123'
      ..adType = BranchEventAdType.BANNER
      ..addCustomData(
          'Custom_Event_Property_Key1', 'Custom_Event_Property_val1')
      ..addCustomData(
          'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');

    eventCustom = BranchEvent.customEvent('Custom_event')
      ..addCustomData(
          'Custom_Event_Property_Key1', 'Custom_Event_Property_val1')
      ..addCustomData(
          'Custom_Event_Property_Key2', 'Custom_Event_Property_val2');
  }

  @override
  void initState() {
    listenDynamicLinks();
    initDeepLinkData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    );
    if (appFlavor == AppFlavor.DEV) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            ScreenUtilInit(
              minTextAdapt: true,
              designSize: const Size(375, 745),
              builder: (_, child) => GetMaterialApp(
                debugShowCheckedModeBanner: false,
                builder: (BuildContext context, Widget? widget) {
                  ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
                      CustomError(errorDetails: errorDetails);
                  return widget!;
                },
                locale: const Locale('en'),
                title: StringConstants.appName,
                theme: themeData(context),
                darkTheme: darkThemeData(context),
                themeMode: widget.themeMode!,
                getPages: AppPages.pages,
                initialRoute: AppPages.initial,
                translations: TranslationsFile(),
                enableLog: true,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 2,
                  left: 2,
                ),
                child: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? Dimens.box0
                          : Banner(
                              message:
                                  '${snapshot.data?.version} (${snapshot.data?.buildNumber})',
                              location: BannerLocation.topStart,
                            ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 745),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? widget) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
              CustomError(errorDetails: errorDetails);
          return widget!;
        },
        locale: const Locale('en'),
        title: StringConstants.appName,
        theme: themeData(context),
        darkTheme: darkThemeData(context),
        themeMode: widget.themeMode!,
        getPages: AppPages.pages,
        initialRoute: AppPages.initial,
        translations: TranslationsFile(),
        enableLog: true,
      ),
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({
    Key? key,
    required this.errorDetails,
  }) : super(key: key);
  final FlutterErrorDetails errorDetails;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: Dimens.edgeInsets16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetConstants.cryClipart),
              Dimens.boxHeight10,
              Text(
                kDebugMode
                    ? errorDetails.summary.toString()
                    : 'issueProcessingRequest'.tr,
                textAlign: TextAlign.center,
                style: Styles.blackBold18.copyWith(
                  color: kDebugMode ? Colors.red : Colors.black,
                ),
              ),
              Dimens.boxHeight20,
              // CustomButton(
              //   title: 'goBack'.tr,
              //   onPress: Get.back,
              // ),
            ],
          ),
        ),
      );
}
