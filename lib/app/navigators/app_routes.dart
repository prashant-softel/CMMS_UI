// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const jobList = _Paths.jobList;
  static const jobCard = _Paths.jobCardDetails;
  static const jobDetails = _Paths.jobDetails;
  static const addJob = _Paths.addJob;
  static const editJob = _Paths.editJob;
  static const facility = _Paths.facility;
  static const login = _Paths.login;
  static const preventive = _Paths.preventive;
  static const createCheckList = _Paths.createCheckList;
  static const preventiveList = _Paths.preventiveList;
  static const preventiveCheckPoint = _Paths.preventiveCheckPoint;
  static const breakdown = _Paths.breakdown;
  static const new_permit = _Paths.new_permit;
  static const new_Permit_List  = _Paths.new_Permit_List;
  static const warranty_Claim_List = _Paths.warranty_Claim_List;
  static const pmMapping = _Paths.pmMapping;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-screen';
  static const jobList = '/job-list-screen';
  static const jobDetails = '/job-details-screen';
  static const addJob = '/add-job-screen';
  static const editJob = '/edit-job-screen';
  static const facility = '/facility';
  static const jobCardDetails = '/job-card-details';
  static const login = '/login-screen';
  static const preventive = '/preventive-screen';
  static const create_checkList = '/create_preventive_checklist-screen';
  static const preventive_List = '/preventive-list-screen';
  static const breakdown = '/breakdown-maintenance';
  static const new_permit = '/new-permit';
  static const createCheckList = '/create_preventive_checklist-screen';
  static const preventiveList = '/preventive-list-screen';
  static const preventiveCheckPoint = '/preventive-check-point';
  static const new_Permit_List = '/new-permit-list';
  static const warranty_Claim_List = '/warranty-claim-list';
  static const pmMapping = '/pm-mapping-screen';
}
