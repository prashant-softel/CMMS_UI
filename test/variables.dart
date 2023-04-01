// import 'package:cmms/app/auth/auth_controller.dart';
// import 'package:cmms/app/auth/auth_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/data/helpers/connect_helper.dart';
import 'package:cmms/data/repositories/data_repositories.dart';
import 'package:cmms/device/repositories/device_repositories.dart';
import 'package:cmms/domain/repositories/repository.dart';
// import 'package:cmms/domain/usecases/auth_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

abstract class Variables {
  static final layerBinding = BindingsBuilder<dynamic>(() {
    Get
      ..lazyPut(ConnectHelper.new)
      ..lazyPut(() => DataRepository(Get.put(ConnectHelper())))
      ..lazyPut(DeviceRepository.new)
      ..lazyPut(() => Repository(Get.find(), Get.find(),));
  });

  static final authBinding = BindingsBuilder<dynamic>(() {
    // Get.put<AuthController>(
    //   AuthController(
    //     Get.put(
    //       AuthPresenter(
    //         AuthUseCases(
    //           Get.find(),
    //         ),
    //       ),
    //     ),
    //   ),
    //   permanent: true,
    // );
  });

  /// Get the material app wrapper for the pages
  static Material getTheMaterialAppWrapper(Widget widget) => Material(
        child: ScreenUtilInit(
          designSize: const Size(375, 745),
          builder: (BuildContext c1, _) => GetMaterialApp(
            home: widget,
            getPages: AppPages.pages,
          ),
        ),
      );
}
