// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/calibration/calibration_list_controller.dart';
import 'package:cmms/app/calibration/calibration_list_presenter.dart';
import 'package:cmms/app/job_list/job_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_controller.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_presenter.dart';
import 'package:cmms/app_config.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_maintenance_controller.dart';
import 'package:cmms/app/breakdown_maintenance/breakdown_presenter.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/calibration_list_usecase.dart';
import 'package:cmms/domain/usecases/preventive_usecase.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:mixpanel_flutter/mixpanel_flutter.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app/job_list/job_list_controller.dart';

Future<void> mainCommon(AppConfig appConfig) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // FlutterBranchSdk.validateSDKIntegration();
    // if (!GetPlatform.isWeb) {
    //   await Firebase.initializeApp();
    //   // The following lines are the same as previously explained in "Handling uncaught errors"
    //   FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // }

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
  // await Mixpanel.init(AppConstants.mixPannelId,
  //     optOutTrackingDefault: false, trackAutomaticEvents: true);
}

Future<void> initPlatformState() async {
//   var oneSignalId = '';
//   if (appFlavor == AppFlavor.PROD) {
//     oneSignalId = '';
//   } else {
//     oneSignalId = '';
//   }
//   await OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
//   await OneSignal.shared.setAppId(oneSignalId);
//   await OneSignal.shared
//       .promptUserForPushNotificationPermission()
//       .then((accepted) {
//     log('############ NOTIFICATION $accepted');
//   });

//   OneSignal.shared.setNotificationWillShowInForegroundHandler(
//       (OSNotificationReceivedEvent event) {
//     // Will be called whenever a notification is received in foreground
//     // Display Notification, pass null param for not displaying the notification
//     event.complete(event.notification);
//     log('############ NOTIFICATION FOREGROUND ${event.notification}');
//   });

//   OneSignal.shared
//       .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
//     // Will be called whenever a notification is opened/button pressed.
//     log('############ NOTIFICATION OPENHANDLER ${result.notification}');
//   });

//   OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
//     // Will be called whenever the permission changes
//     // (ie. user taps Allow on the permission prompt in iOS)
//     log('############ NOTIFICATION setPermissionObserver $changes');
//   });

//   OneSignal.shared
//       .setSubscriptionObserver((OSSubscriptionStateChanges changes) {
//     // Will be called whenever the subscription changes
//     // (ie. user gets registered with OneSignal and gets a user ID)
//     log('############ NOTIFICATION setSubscriptionObserver $changes');
//   });

//   OneSignal.shared.setEmailSubscriptionObserver(
//       (OSEmailSubscriptionStateChanges emailChanges) {
//     // Will be called whenever then user's email subscription changes
//     // (ie. OneSignal.setEmail(email)
// //  is called and the user gets registered
//     log('############ NOTIFICATION setEmailSubscriptionObserver $emailChanges');
//   });
}

Future<void> initServices() async {
  await Hive.initFlutter();

  Hive.registerAdapter(DownloadTaskModelAdapter());

  await Hive.openBox<DownloadTaskModel>('download_task_model');

  var repository = Get.put(
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
  Get.lazyPut(() => Get.put(
        () => HomeController(
          Get.put(
            HomePresenter(
              Get.put(HomeUsecase(repository)),
            ),
            permanent: true,
          ),
        ),
        permanent: true,
      ));

  Get.lazyPut(
    () => BreakdownMaintenanceController(
      Get.put(
        BreakdownMaintenancePresenter(
          Get.put(BreakdownMaintenanceUsecase(repository)),
        ),
        permanent: true,
      ),
    ),
    //permanent: true,
  );
  Get.lazyPut(
    () => PreventiveController(
      Get.put(
        PreventivePresenter(
          Get.put(PreventiveUsecase(repository)),
        ),
        permanent: true,
      ),
    ),
    //permanent: true,
  );

  Get.lazyPut(
    () => JobListController(
      Get.put(
        JobListPresenter(
          Get.put(JobListUsecase(Get.find())),
        ),
        permanent: true,
      ),
    ),
    //permanent: true,
  );
  Get.lazyPut(
    () => CalibrationListController(
      Get.put(
        CalibrationListPresenter(
          Get.put(CalibrationListUsecase(Get.find())),
        ),
        permanent: true,
      ),
    ),
    //permanent: true,
  );

  /// Services
  await Get.putAsync(() => CommonService().init());
  await Get.putAsync(() => DbService().init());
  if (!GetPlatform.isWeb) {
    await initPlatformState();
    await initMixpanel();
  }
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

  @override
  void initState() {
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
