// coverage:ignore-file

import 'dart:async';
// import 'package:connectivity/connectivity.dart';

// import 'package:cmms/app/app.dart';
import 'package:get/get.dart';

/// A service which will be used to handle the basic
/// operations in the application. This will be used to separate the UI related
/// work like controllers, permission and etc.
///
/// The codes which are commented as coverage:ignore-start for them
/// the test codes are not needed as of now. So as the application grows and
/// the code are used then we will remove the ignore statement.
class CommonService extends GetxService {
  StreamSubscription? _streamSubscription;

  /// initialize Device plugin
  Future<CommonService> init() async {
    onInit();
    // deviceInfoPlugin = DeviceInfoPlugin();
    return this;
  }

  /// initialize Device plugin
  // var deviceInfoPlugin = DeviceInfoPlugin();

  // @override
  // void onInit() {
  //   // _checkForInternetConnectivity();
  //   super.onInit();
  // }

  @override
  void onClose() {
    _streamSubscription?.cancel();
    super.onClose();
  }

  // /// Starts the check for internet connectivity. If there is no connection
  // /// with the internet a text message will be shown. If the application
  // /// is not able to connect to the internet even if the connection is available
  // /// will ask the user to check the internet permission.
  // void _checkForInternetConnectivity() {
  //   _streamSubscription = Connectivity().onConnectivityChanged.listen(
  //     (ConnectivityResult result) async {
  //       if (result != ConnectivityResult.none) {
  //         Utility.closeDialog();
  //       } else {
  //         await Utility.showNoInternetDialog();
  //       }
  //     },
  //   );
  // }
}
