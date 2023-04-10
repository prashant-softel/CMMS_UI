// coverage:ignore-file

import 'package:cmms/app/app.dart';
import 'package:cmms/app/breakdown_maintenance/view/breakdown_maintenance.dart';
import 'package:cmms/app/calibration/view/calibration_list_screen.dart';
import 'package:cmms/app/calibration_history/calibration_history_binding.dart';
import 'package:cmms/app/calibration_history/view/calibration_history_screen.dart';
import 'package:cmms/app/create_preventive_checklist/view/create_preventive_screen.dart';
import 'package:cmms/app/new_permit/new_permit_binding.dart';
import 'package:cmms/app/new_permit/view/new_permit_screen.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_binding.dart';
import 'package:cmms/app/preventive_check_point/view/preventive_check_point_screen.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_screen.dart';
// import 'package:cmms/warranty_claim_list/warranty_claim_list_binding.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_list_screen.dart';
import 'package:cmms/app/warranty_claim_list/web/view_warranty_claim_web.dart';
import 'package:get/get.dart';
import '../add_job/add_job_binding.dart';
import '../add_job/views/add_job_screen.dart';
import '../calibration/calibration_list_binding.dart';
import '../create_preventive_checklist/create_preventive_checklist_binding.dart';
import '../edit_job/edit_job_binding.dart';
import '../edit_job/views/edit_job_screen.dart';
import '../facility/facility_binding.dart';
import '../facility/facility_view.dart';
import '../job_card_details/job_card_details_binding.dart';
import '../job_card_details/views/job_card_details_screen.dart';
import '../job_details/job_details_binding.dart';
import '../job_details/views/job_details_screen.dart';
import '../job_list/job_list_binding.dart';
import '../job_list/views/job_list_screen.dart';
import '../login/login_binding.dart';
import '../login/view/login_screen.dart';
import '../pm_mapping/pm_mapping_binding.dart';
import '../pm_mapping/view/pm_mapping_screen.dart';
import '../preventive_List/preventive_list_binding.dart';
import '../preventive_List/view/preventive_list_screen.dart';
import '../preventive_maintanance/view/preventive_maintenance_screen.dart';

// coverage:ignore-file

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
/// and will be used in the material app.
/// Will be ignored for test since all are static values and would not change.
class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  //static const initial = Routes.home;
  static const initial = Routes.login;

  static final pages = <GetPage<dynamic>>[
    GetPage<SplashScreen>(
      name: _Paths.splash,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<HomeScreen>(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<dynamic>(
      name: _Paths.jobList,
      page: JobListScreen.new,
      binding: JobListBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<dynamic>(
      name: _Paths.addJob,
      page: AddJobScreen.new,
      binding: AddJobBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.editJob,
      page: EditJobScreen.new,
      binding: EditJobBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.jobDetails,
      page: JobDetailsScreen.new,
      binding: JobDetailsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage<dynamic>(
      name: _Paths.facility,
      page: FacilityView.new,
      binding: FacilityBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.jobCardDetails,
      page: JobCardDetailsScreen.new,
      binding: JobCardDetailsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.login,
      page: LoginScreen.new,
      binding: LoginBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.preventive,
      page: PreventiveScreen.new,
      binding: PreventiveBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createCheckList,
      page: CreatePriventiveListScreen.new,
      binding: CreatePriventiveListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.preventiveList,
      page: PreventiveListScreen.new,
      binding: PreventiveListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.newPermit,
      page: NewPermitScreen.new,
      binding: NewPermitBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.newPermitList,
      page: NewPermitListScreen.new,
      binding: NewPermitListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.preventiveCheckPoint,
      page: PreventiveCheckPointScreen.new,
      binding: PreventiveCheckPointBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.preventiveMaintenanceMapping,
      page: PmMappingScreen.new,
      binding: PmMappingBinding(),
    ),
    // GetPage<dynamic>(
    //   name: _Paths.warranty_Claim_List,
    //   page: WarrantyClaimListScreen.new,
    // ),
    GetPage<dynamic>(
      name: _Paths.calibrationList,
      page: CalibrationListScreen.new,
      binding: CalibrationListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.calibrationHistory,
      page: CalibrationHistoryScreen.new,
      binding: CalibrationHistoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.breakdown,
      page: BreakdownMaintenanceScreen.new,
    ),
    GetPage<dynamic>(
      name: _Paths.viewWarrantyClaim,
      page: ViewWarrantyClaimWeb.new,
    ),
  ];
}
