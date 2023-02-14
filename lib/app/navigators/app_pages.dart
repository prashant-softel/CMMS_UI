// coverage:ignore-file

import 'package:cmms/app/app.dart';
import 'package:cmms/app/warranty/add_new_warranty_view.dart';
import 'package:cmms/app/warranty/warranty.dart';
import 'package:get/get.dart';

import '../add_job/add_job_binding.dart';
import '../add_job/views/add_job_screen.dart';

import '../facility/facility_binding.dart';
import '../facility/facility_view.dart';
import '../job_details/job_details_binding.dart';
import '../job_details/views/job_details_screen.dart';
import '../job_list/job_list_binding.dart';
import '../job_list/views/job_list_screen.dart';

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
  static const initial = Routes.home;

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
    GetPage<WarrentyScreen>(
      name: _Paths.warranty,
      transitionDuration: transitionDuration,
      page: WarrentyScreen.new,
      binding: WarrantyBinding(),
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
    GetPage<NewWarrantyClaim>(
      name: _Paths.warranty,
      transitionDuration: transitionDuration,
      page: NewWarrantyClaim.new,
      binding: WarrantyBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
