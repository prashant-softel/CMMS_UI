// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const warranty = _Paths.warranty;
  static const jobList = _Paths.jobList;
  static const jobDetails = _Paths.jobDetails;
  static const addJob = _Paths.addJob;
  static const facility = _Paths.facility;
  static const newWarrantyClaim = _Paths.newWarrantyClaim;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-screen';
  static const warranty = '/warranty-screen';
  static const jobList = '/job-list-screen';
  static const jobDetails = '/job-details-screen';
  static const addJob = '/add-job-screen';
  static const facility = '/facility';
  static const newWarrantyClaim = '/newWarrantyClaim';
}
