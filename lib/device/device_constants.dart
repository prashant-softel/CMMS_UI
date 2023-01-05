// coverage:ignore-file

/// A chunk of shared preference keys which will
/// be used by DeviceRepository to get/save the data locally.
///
/// Will be ignored for test since all are static values and would not change.
abstract class DeviceConstants {
  static const String localLang = 'localLang';
  static const String username = 'username';
  static const String userLoggedIn = 'userLoggedIn';
  static const String password = 'password';
  static const String tabValue = 'tab';
  static const String id = 'id';
  static const String appVersion = '0.0.1';
  static const String googleApiKey = 'AIzaSyAZIWv4yxMfeZpBS0QD_vvnJl2Mxl0fV7o';
}
