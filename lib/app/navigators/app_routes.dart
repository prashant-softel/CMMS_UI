// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-screen';
}
