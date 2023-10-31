// coverage:ignore-file

import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_binding.dart';
import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_screen.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_binding.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_screen.dart';
import 'package:cmms/app/add_inventory/add_inventory_binding.dart';
import 'package:cmms/app/add_inventory/view/add_inventory_ui.dart';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_binding.dart';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_screen.dart';

import 'package:cmms/app/add_user/add_user_binding.dart';
import 'package:cmms/app/add_user/view/add_user_screen.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/audit/audit_binding.dart';
import 'package:cmms/app/audit/view/audit_screen.dart';
import 'package:cmms/app/audit_list/audit_list_binding.dart';
import 'package:cmms/app/audit_list/view/audit_list_screen.dart';
import 'package:cmms/app/breakdown_maintenance/view/breakdown_maintenance_screen.dart';
import 'package:cmms/app/business_List/view/business_list_screen.dart';
import 'package:cmms/app/calibration/view/calibration_list_screen.dart';
import 'package:cmms/app/calibration_detail/calibration_detail_binding.dart';
import 'package:cmms/app/calibration_history/calibration_history_binding.dart';
import 'package:cmms/app/calibration_history/view/calibration_history_screen.dart';
import 'package:cmms/app/calibration_view/calibration_view_binding.dart';
import 'package:cmms/app/create_mrs/create_mrs_binding.dart';
import 'package:cmms/app/create_mrs/view/create_mrs_screen.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_binding.dart';
import 'package:cmms/app/create_pm_plan/view/create_pm_plan_screen.dart';
import 'package:cmms/app/create_preventive_checklist/view/create_preventive_screen.dart';
import 'package:cmms/app/edit_mrs/view/edit_mrs_screen.dart';
import 'package:cmms/app/edit_return_mrs/edit_return_mrs_binding.dart';
import 'package:cmms/app/edit_return_mrs/view/edit_return_mrs_screen.dart';
import 'package:cmms/app/edit_warranty_claim/edit_%20warranty_claim_binding.dart';
import 'package:cmms/app/edit_warranty_claim/view/edit_warranty_claim_content_web.dart';
import 'package:cmms/app/employee_stock_report/view/employee_stock_report_screen.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_binding.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_screen.dart';
import 'package:cmms/app/faulty_material_report/faulty_material_report_binding.dart';
import 'package:cmms/app/faulty_material_report/view/faulty_material_report_screen.dart';
import 'package:cmms/app/hoto/hoto_list_binding.dart';
import 'package:cmms/app/hoto/view/hoto_list_screen.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_binding.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_screen.dart';
import 'package:cmms/app/inventory_list/inventory_list_binding.dart';
import 'package:cmms/app/issue_mrs_approve_reject/issue_mrs_approve_binding.dart';
import 'package:cmms/app/module_cleaning_dashboard/module_binding.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_binding.dart';
import 'package:cmms/app/module_cleaning_execution/view/module_cleaning_list_execution_screen.dart.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_binding.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_planning_screen.dart.dart';

import 'package:cmms/app/module_cleaning_planning/module_cleaning_planning_binding.dart';
import 'package:cmms/app/module_cleaning_planning/view/module_cleaning_planning_screen.dart';
import 'package:cmms/app/mrs/mrs_list_binding.dart';
import 'package:cmms/app/mrs/view/mrs_list_screen.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_binding.dart';
import 'package:cmms/app/mrs_approve/view/mrs_approve_screen.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_binding.dart';
import 'package:cmms/app/mrs_issue/view/mrs_issue_screen.dart';
import 'package:cmms/app/create_mrs_return/create_mrs_return_binding.dart';
import 'package:cmms/app/create_mrs_return/view/create_mrs_return_screen.dart';
import 'package:cmms/app/mrs_view/mrs_view_binding.dart';
import 'package:cmms/app/mrs_view/view/mrs_view_screen.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_binding.dart';
import 'package:cmms/app/request_goods_orders_list.dart/request_goods_orders_list_binding.dart';
import 'package:cmms/app/transaction_report/view/transaction_report_list_screen.dart';
import 'package:cmms/app/utils/printing.dart';
import 'package:cmms/app/view_mc_plan/view/view_mc_planning_screen.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_binding.dart';
import 'package:cmms/app/view_request_orders/request_goods_orders_view_binding.dart';
import 'package:cmms/app/role_access/role_access_binding.dart';
import 'package:cmms/app/role_access/view/role_access_screen.dart';
import 'package:cmms/app/role_notification/view/role_notification_screen.dart';
import 'package:cmms/app/stock_management/stock_management_binding.dart';
import 'package:cmms/app/stock_management/view/stock_management.screen.dart';
import 'package:cmms/app/stock_managment_goods_list_orders.dart/stock_management_goods_list_orders_binding.dart';
import 'package:cmms/app/stock_managment_goods_list_orders.dart/view/stock_management_goods_list_orders_screen.dart';
import 'package:cmms/app/request_order_details/view/request_order_screen.dart';

import 'package:cmms/app/tbt_list_sop/tbt_list_sop_binding.dart';
import 'package:cmms/app/tbt_list_sop/view/tbt_list_sop_screen.dart';
import 'package:cmms/app/tbt_type_list/tbt_type_list_binding.dart';
import 'package:cmms/app/tbt_type_list/view/tbt_type_list_screen.dart';
// import 'package:cmms/app/job_list_sop/job_list_sop_binding.dart';
// import 'package:cmms/app/job_list_sop/view/job_list_sop_screen.dart';
import 'package:cmms/app/asset_type_list/asset_type_list_binding.dart';
import 'package:cmms/app/asset_type_list/view/asset_type_list_screen.dart';
import 'package:cmms/app/facility_type_list/facility_type_list_binding.dart';
import 'package:cmms/app/facility_type_list/view/facility_type_list_screen.dart';
import 'package:cmms/app/block_type_list/block_type_list_binding.dart';
import 'package:cmms/app/block_type_list/view/block_type_list_screen.dart';
import 'package:cmms/app/inventory_type_list/view/inventory_type_list.dart';
import 'package:cmms/app/inventory_type_list/inventory_type_list_binding.dart';
// import 'package:cmms/app/job_type_list/job_type_list_binding.dart';
// import 'package:cmms/app/job_type_list/view/job_type_list_screen.dart';
import 'package:cmms/app/master_dashboard/master_binding.dart';
import 'package:cmms/app/master_dashboard/master_dashboard_screen.dart';
import 'package:cmms/app/permit_type/permit_type_binding.dart';
import 'package:cmms/app/permit_type/view/permit_type_screen.dart';
import 'package:cmms/app/safety_questions_list/safety_questions_list_binding.dart';
import 'package:cmms/app/safety_questions_list/safety_question_list_screen.dart';
import 'package:cmms/app/user_profile/user_profile_binding.dart';
import 'package:cmms/app/user_profile/view/user_profile_screen.dart';
import 'package:cmms/app/view_add_goods_orders.dart/stock_management_view_add_goods_orders_binding.dart';
import 'package:cmms/app/view_add_goods_orders.dart/view/stock_management_view_add_goods_orders_screen.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_binding.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_ui.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_binding.dart';
import 'package:cmms/app/view_escalation_matrix/view_escalation_matrix_screen.dart';
import 'package:cmms/app/view_module_cleaning_execution/view_module_cleaning_execution_binding.dart';
import 'package:cmms/app/view_module_cleaning_execution/view_module_cleaning_execution_screen.dart';
import 'package:cmms/app/view_permit/view_permit_binding.dart';
import 'package:cmms/app/view_permit/view/web/view_permit_screen_web.dart';
import 'package:cmms/app/inventory/view/inventory_screen.dart';
import 'package:cmms/app/new_permit/new_permit_binding.dart';
import 'package:cmms/app/new_permit/view/new_permit_screen.dart';
import 'package:cmms/app/preventive_check_point/preventive_check_point_binding.dart';
import 'package:cmms/app/preventive_check_point/view/preventive_check_point_screen.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_screen.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_binding.dart';
import 'package:cmms/app/view_warranty_claim/view/view_warranty_claim_content_web.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_binding.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_binding.dart';
import '../approve_return_mrs/approve_return_mrs_binding.dart';
import '../approve_return_mrs/view/approve_return_mrs_screen.dart';
import '../calibration_certificate/calibration_certificate_binding.dart';
import '../calibration_certificate/view/calibration_certificate_screen.dart';
import '../change_password/change_password_binding.dart';
import '../change_password/view/change_password_screen.dart';
import '../employee_stock_report/employee_stock_report_binding.dart';
import '../insurance_status/insurance_status_listContent_binding.dart';
import '../insurance_status/view/insurance_status_listContent_screen.dart';
// import 'package:cmms/warranty_claim_list/warranty_claim_list_binding.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_list_screen.dart';
import 'package:cmms/app/warranty_claim_list/web/new_warranty_claim_web.dart';
import 'package:get/get.dart';
import '../SPV_list/SPV_list_binding.dart';
import '../SPV_list/view/SPV_list_screen.dart';
import '../add_job/add_job_binding.dart';
import '../add_job/views/add_job_screen.dart';
import '../blood_list/blood_list_binding.dart';
import '../blood_list/view/blood_list_screen.dart';
import '../breakdown_maintenance/breakdown_maintenance_binding.dart';
import '../business_List/business_list_binding.dart';
import '../business_type_List/business_type_list_binding.dart';
import '../business_type_List/view/business_type_list_screen.dart';
import '../calibration/calibration_list_binding.dart';
import '../calibration_detail/view/calibration_detail_screen.dart';
import '../calibration_view/view/calibration_view_screen.dart';
import '../country_list/country_list_binding.dart';
import '../country_list/view/country_list_screen.dart';
import '../create_preventive_checklist/create_preventive_checklist_binding.dart';
import '../document_manager/document_manager_binding.dart';
import '../document_manager/view/document_manager_screen.dart';
import '../edit_job/edit_job_binding.dart';
import '../edit_job/views/edit_job_screen.dart';
import '../edit_mrs/edit_mrs_binding.dart';
import '../facility/facility_binding.dart';
import '../facility/facility_view.dart';
import '../frequency_List/frequency_list_binding.dart';
import '../frequency_List/view/frequency_list_screen.dart';
import '../import_inventory/import_inventory_binding.dart';
import '../import_inventory/view/import_inventory_screen.dart';
import '../incident_dashboard/incident_report_binding.dart';
import '../incident_dashboard/view/incident_screen.dart';
import '../incident_risk_type/incident_listContent_binding.dart';
import '../incident_risk_type/view/incident_listContent_screen.dart';
import '../insurance_provider/insurance_provider_listContent_binding.dart';
import '../insurance_provider/view/insurance_provider_listContent_screen.dart';
import '../inventory/inventory_binding.dart';
import '../inventory_category_list/inventory_category_list_binding.dart';
import '../inventory_category_list/view/inventory_category_list.dart';
import '../inventory_list/views/inventory_list_screen.dart';
import '../inventory_status_list/inventory_status_list_binding.dart';
import '../inventory_status_list/view/inventory_status_list.dart';
import '../issue_mrs_approve_reject/view/issue_mrs_approve_screen.dart';
import '../job_card_details/job_card_details_binding.dart';
import '../job_card_details/views/job_card_details_screen.dart';
import '../job_card_list/views/job_card_list_screen.dart';
import '../job_card_list/job_card_binding.dart';
import '../job_details/job_details_binding.dart';
import '../job_details/views/job_details_screen.dart';
import '../job_list/job_list_binding.dart';
import '../job_list/views/job_list_screen.dart';
import '../login/login_binding.dart';
import '../login/view/login_screen.dart';
import '../module_List/module_list_binding.dart';
import '../module_List/view/module_list_screen.dart';
import '../module_cleaning_dashboard/view/module_dashboard_screen.dart';
import '../plant_stock_report/plant_stock_report_binding.dart';
import '../plant_stock_report/view/plant_stock_report_screen.dart';
import '../pm_mapping/pm_mapping_binding.dart';
import '../pm_mapping/view/pm_mapping_screen.dart';
import '../pm_plan_list/view/pm_plan_list_screen.dart';
import '../pm_schedule/pm_schedule_binding.dart';
import '../pm_schedule/view/pm_schedule_screen.dart';
import '../pm_task_view/pm_task_view_binding.dart';
import '../pm_task_view/view/pm_task_view_screen.dart';
import '../preventive_List/preventive_list_binding.dart';
import '../preventive_List/view/preventive_list_screen.dart';
import '../preventive_maintanance/view/preventive_maintenance_screen.dart';
import '../preventive_maintenance_execution/preventive_maintenance_execution_binding.dart';
import '../preventive_maintenance_execution/view/preventive_maintenance_execution_screen.dart';
import '../preventive_maintenance_execution_view/preventive_maintenance_execution_view_binding.dart';
import '../preventive_maintenance_execution_view/view/preventive_maintenance_execution_view_screen.dart';
import '../preventive_maintenance_task/preventive_maintenance_task_binding.dart';
import '../preventive_maintenance_task/view/preventive_maintenance_task_screen.dart';
import '../request_goods_orders_list.dart/view/request_goods_orders__list_screen.dart';
import '../risk_type/risk_type_binding.dart';
import '../risk_type/view/risk_type_screen.dart';
import '../source_of_observation/source_of_obs_binding.dart';
import '../source_of_observation/view/source_of_obs_screen.dart';
import '../transaction_report/transaction_report_list_binding.dart';
import '../type_of_observation/type_of_obs_binding.dart';
import '../type_of_observation/view/type_of_obs_screen.dart';
import '../view_request_orders/view/request_goods_orders_view_screen.dart';
import '../receive_goods_order/receive_goods_order_binding.dart';
import '../receive_goods_order/receive_goods_order_screen.dart';
import '../return_mrs/return_mrs_binding.dart';
import '../return_mrs/view/return_mrs_screen.dart';
import '../role_List/role_list_binding.dart';
import '../role_notification/role_notification_binding.dart';
import '../setting_dashboard/setting_dashboard_binding.dart';
import '../setting_dashboard/view/setting_dashboard_screen.dart';
import '../state_list_screen/state_list_binding.dart';
import '../state_list_screen/view/state_list_content_screen.dart';
import '../stock_managment_add_goods_orders.dart/stock_management_add_goods_orders_binding.dart';
import '../stock_managment_add_goods_orders.dart/view/stock_management_add_goods_orders_screen.dart';
import '../request_order_details/request_order_details_binding.dart';
import '../user_list/user_list_binding.dart';
import '../user_list/view/user_list_screen.dart';
import '../role_List/view/role_list_screen.dart';
import '../view_incident_report/view_incident_report_binding.dart';
import '../view_incident_report/view_incident_report_screen.dart';
import '../view_pm_plan/view/view_pm_plan_screen.dart';
import '../view_return_mrs/view/view_return_mrs_screen.dart';
import '../view_return_mrs/view_return_mrs_binding.dart';
import '../view_user_detail/view/view_user_detail_screen.dart';
import '../view_user_detail/view_user_detail_binding.dart';
import '../warrantyType/view/warranty_list_screen.dart';
import '../warrantyType/warranty_list_binding.dart';
import '../Asset_Master/asset_master_Binding.dart';
import '../Asset_Master/view/asset_master_screen.dart';
import '../add_asset_master/view/add_asset_master_screen.dart';
import '../add_asset_master/add_asset_master_binding.dart';
import '../designation_List/view/designation_list_screen.dart';
import '../designation_List/designation_list_binding.dart';
import '../competency_list/view/competency_list_screen.dart';
import '../competency_list/competency_list_binding.dart';
import '../warranty_certificate/view/warranty_certificate_screen.dart';
import '../warranty_certificate/warranty_certificate_binding.dart';

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
    // GetPage<dynamic>(
    //   name: _Paths.print,
    //   page: CreatePdfStatefulWidget.new,
    //   // binding: LoginBinding(),
    // ),
    GetPage<dynamic>(
      name: _Paths.preventive,
      page: PreventiveScreen.new,
      binding: PreventiveBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.audit,
      page: AuditScreen.new,
      binding: AuditBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.stockManagementDashboardScreen,
      page: StockManagementDashboardScreen.new,
      binding: StockManagementDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.stockManagementGoodsOrdersScreen,
      page: StockManagementGoodsOrdersScreen.new,
      binding: StockManagementGoodsOrdersBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createCheckList,
      page: CreatePriventiveListScreen.new,
      binding: CreatePreventiveListBinding(),
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
    GetPage<dynamic>(
      name: _Paths.featureTypeListScreen,
      page: ModuleListScreen.new,
      binding: ModuleListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.warrantyClaimList,
      page: WarrantyClaimListScreen.new,
      binding: HomeBinding(),
    ),
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
        binding: BreakdownMaintenanceBinding()),
    GetPage<dynamic>(
        name: _Paths.viewWarrantyClaim,
        page: ViewWarrantyClaimWeb.new,
        binding: ViewWarrantyClaimBinding()),
    GetPage<dynamic>(
      name: _Paths.calibrationDetail,
      page: CalibrationDetailScreen.new,
      binding: CalibrationDetailBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.pmSchedule,
      page: PmScheduleScreen.new,
      binding: PmScheduleBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.pmTask,
      page: PreventiveMaintenanceTaskScreen.new,
      binding: PreventiveMaintenanceTaskBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.pmExecution,
      page: PreventiveMaintenanceExecutionScreen.new,
      binding: PreventiveMaintenanceExecutionBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.pmExecutionView,
      page: PreventiveMaintenanceExecutionViewScreen.new,
      binding: PreventiveMaintenanceExecutionViewBinding(),
    ),
    GetPage<dynamic>(
        name: _Paths.newWarrantyClaimList,
        page: NewWarrantyClaimWeb.new,
        binding: WarrantyClaimBinding()),
    GetPage<dynamic>(
        name: _Paths.warrantyClaimListWeb,
        page: WarrantyClaimListScreen.new,
        binding: WarrantyClaimBinding()),

    GetPage<dynamic>(
        name: _Paths.viewPermitWebScreen,
        page: ViewPermitWebScreen.new,
        binding: ViewPermitBinding()),

    GetPage<dynamic>(
        name: _Paths.masterDashboard,
        page: MastersDashboard.new,
        binding: MastersBinding()),
    GetPage<dynamic>(
        name: _Paths.permitTypeScreen,
        page: PermitTypeScreen.new,
        binding: PermitTypeBinding()),
    // name: _Paths.warrantyClaimListWeb,
    // page: WarrantyClaimListWeb.new,
    // binding: HomeBinding()),
    // GetPage<dynamic>(
    //   name: _Paths.editPermitWebScreen,
    //   page: EditPermitWebScreen.new,
    //   binding: EditPermitBinding()
    // ),

    GetPage<dynamic>(
      name: _Paths.pmTaskView,
      page: PreventiveMaintenanceTaskViewScreen.new,
      binding: PreventiveMaintenanceTaskViewBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addInventoryScreen,
      page: AddInventoryScreen.new,
      binding: AddInventoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewAddInventoryScreen,
      page: ViewAddInventoryScreen.new,
      binding: ViewAddInventoryBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.inventory,
      page: InventoryScreen.new,
      binding: InventoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.inventoryList,
      page: InventoryListScreen.new,
      binding: InventoryListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.safetyQuestionsList,
      page: SafetyQestionsListScreen.new,
      binding: SafetyQuestionsListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.tbtTypeListScreen,
      page: TBTTypeListScreen.new,
      binding: TBTTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.tbtSOPListScreen,
      page: TBTSOPListScreen.new,
      binding: TBTSOPListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.assetTypeListScreen,
      page: AssetTypeListScreen.new,
      binding: AssetTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.inventoryTypeListScreen,
      page: InventoryTypeListScreen.new,
      binding: InventoryTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.inventoryStatusListScreen,
      page: InventoryStatusListScreen.new,
      binding: InventoryStatusListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.facilityTypeListScreen,
      page: FacilityTypeListScreen.new,
      binding: FacilityTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.SPVListScreen,
      page: SPVListScreen.new,
      binding: SPVListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.blockTypeListScreen,
      page: BlockTypeListScreen.new,
      binding: BlockTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.importInventory,
      page: ImportInventoryScreen.new,
      binding: ImportInventoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.userList,
      page: UserListScreen.new,
      binding: UserListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addUser,
      page: AddUserScreen.new,
      binding: AddUserBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewUserDetail,
      page: ViewUserDetailScreen.new,
      binding: ViewUserDetailBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.editWarrantyClaimContentWeb,
      page: EditWarrantyClaimWeb.new,
      binding: EditWarrantyClaimBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.frequencyListScreen,
      page: FrequencyListScreen.new,
      binding: FrequencyListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.businessListScreen,
      page: BusinessListScreen.new,
      binding: BusinessListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.businessTypeListScreen,
      page: BusinessTypeListScreen.new,
      binding: BusinessTypeListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.bloodTypeListScreen,
      page: BloodListScreen.new,
      binding: BloodListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.countryTypeListScreen,
      page: CountryListScreen.new,
      binding: CountryListBinding(),
    ),
    //
    GetPage<dynamic>(
      name: _Paths.stateTypeListScreen,
      page: StateListScreen.new,
      binding: StateListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.roleListScreen,
      page: RoleListScreen.new,
      binding: RoleListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.warrantyType,
      page: WarrantyListScreen.new,
      binding: WarrantyListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.calibrationViewScreen,
      page: CalibrationViewScreen.new,
      binding: CalibrationViewBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.mrsListScreen,
      page: MrsListScreen.new,
      binding: MrsListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.viewGoodsOrders,
      page: ViewAddGoodsOrdersScreen.new,
      binding: ViewAddGoodsOrdersBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.GoodsOrdersReqDetailsScreen,
      page: StockManagementGoodsOrdersReqdetailsScreen.new,
      binding: GoodsOrdersReqDetailBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.updateGoodsOrdersDetailsScreen,
      page: StockManagementAddGoodsOrdersScreen.new,
      binding: StockManagementAddGoodsOrdersBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.assetMasterList,
      page: AssetMasterScreen.new,
      binding: AssetMasterBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.goToJobCardList,
      page: JobCardScreen.new,
      binding: JobCardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addassetMaster,
      page: AddAssetMasterScreen.new,
      binding: AddAssetMasterBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.incidentReportListWeb,
      page: IncidentReportListScreen.new,
      binding: IncidentReportListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.escalationMatrixListWeb,
      page: EscalationMatrixListScreen.new,
      binding: EscalationMatrixListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addEscalatiomMatrixContentWeb,
      page: AddEscalationMatrixScreen.new,
      binding: AddEscalationMatrixBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewEscalatiomMatrixContentWeb,
      page: ViewEscalationMatrixScreen.new,
      binding: ViewEscalationMatrixBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.mrsViewScreen,
      page: MrsViewScreen.new,
      binding: MrsViewBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.mrsApprovalScreen,
      page: MrsApproveScreen.new,
      binding: MrsApproveBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.mrsIssueScreen,
      page: MrsIssueScreen.new,
      binding: MrsIssueBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.mrsReturnScreen,
      page: CreateMrsReturnScreen.new,
      binding: CreateMrsReturnBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.documentManager,
      page: DocumentManagerScreen.new,
      binding: DocumentManagerBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.roleAccess,
      page: RoleAccessScreen.new,
      binding: RoleAccessBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.designationScreen,
      page: DesignationListScreen.new,
      binding: DesignationListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.addIncidentReportContentWeb,
      page: AddIncidentReportScreen.new,
      binding: AddIncidentReportBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.competencyScreen,
      page: CompetencyListScreen.new,
      binding: CompetencyListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewIncidentReportScreen,
      page: ViewIncidentReportScreen.new,
      binding: ViewIncidentReportBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createMrs,
      page: CreateMrsScreen.new,
      binding: CreateMrsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.incidentRiskType,
      page: IncidentRiskTypeScreen.new,
      binding: IncidentRiskTypeBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.incident_risk_dashboard,
      page: IncidentScreen.new,
      binding: IncidentReportBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.inventoryCategory,
      page: InventoryCategoryListScreen.new,
      binding: InventoryCategoryListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.insuranceProvider,
      page: InsuranceProviderScreen.new,
      binding: InsuranceProviderBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.editMrs,
      page: EditMrsScreen.new,
      binding: EditMrsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.moduleCleaningDashboard,
      page: ModuleCleaningDashboardScreen.new,
      binding: ModuleCleaningDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.moduleCleaningPlanning,
      page: ModuleCleaningPlanningScreen.new,
      binding: ModuleCleaningPlanningBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.hotoListScreenContentWeb,
      page: HotoListScreen.new,
      binding: HotoListScreenBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.auditListScreen,
      page: AuditListScreen.new,
      binding: AuditListScreenBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addModuleCleaningExecutionContentWeb,
      page: AddModuleCleaningExecutionScreen.new,
      binding: AddModuleCleaningExecutionBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewModuleCleaningExecutionScreen,
      page: ViewModuleCleaningExecutionScreen.new,
      binding: ViewModuleCleaningExecutionBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.roleNotification,
      page: RoleNotificationScreen.new,
      binding: RoleNotificationBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.setting,
      page: SettingDashboardScreen.new,
      binding: SettingDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.moduleCleaningListPlan,
      page: ModuleCleaningListPlanScreen.new,
      binding: ModuleCleaningListPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.insuranceStatus,
      page: InsuranceStatusScreen.new,
      binding: InsuranceStatusBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.calibrationCertificate,
      page: CalibrationCertificateScreen.new,
      binding: CalibrationCertificateBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.warrantyCertificate,
      page: WarrantyCertificateScreen.new,
      binding: WarrantyCertificateBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.moduleCleaningListExecution,
      page: ModuleCleaningListExecutionScreen.new,
      binding: ModuleCleaningListExecutionBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.returnMrsList,
      page: ReturnMrsListScreen.new,
      binding: ReturnMrsListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.issueMrsApprove,
      page: IssueMrsApproveScreen.new,
      binding: IssueMrsApproveBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.profile,
      page: UserProfileScreen.new,
      binding: UserProfileBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.changePassword,
      page: ChangePasswordScreen.new,
      binding: ChangePasswordBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.returnMrsView,
      page: MrsReturnViewScreen.new,
      binding: MrsReturnViewBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.approverReturnMrs,
      page: ApproveReturnMrsScreen.new,
      binding: ApproveReturnMrsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.receiveGoodsOrders,
      page: ReceiveGoodsOrdersScreen.new,
      binding: ReceiveGoodsOrdersBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.purchaseGoodsorder,
      page: PurchaseGoodsorderListScreen.new,
      binding: PurchaseGoodsorderListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.purchaseGoodsorderView,
      page: PurchaseGoodsorderViewScreen.new,
      binding: PurchaseGoodsorderViewBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.plantStockReport,
      page: PlantStockReportScreen.new,
      binding: PlantStockReportBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.employeeStockReport,
      page: EmployeeStockReportScreen.new,
      binding: EmployeeStockReportBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.transactionReport,
      page: TransactionReportListScreen.new,
      binding: TransactionReportListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.faultyMaterialReport,
      page: FaultyMaterialReportScreen.new,
      binding: FaultyMaterialReportBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createPmPlan,
      page: CreatePmPlanScreen.new,
      binding: CreatePmPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.editReturnMrs,
      page: EditMrsReturnScreen.new,
      binding: EditMrsReturnBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.pmPlanList,
      page: PmPlanListScreen.new,
      binding: PmPlanListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewPmPlanScreen,
      page: ViewPmPlanScreen.new,
      binding: ViewPmPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.typeofobservation,
      page: TypeOfObsScreen.new,
      binding: TypeOfObsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.sourceofobservation,
      page: SourceOfObsScreen.new,
      binding: SourceOfObsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.risktypemaster,
      page: RiskTypeScreen.new,
      binding: RiskTypeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewMcPlaning,
      page: ViewMcPlaningScreen.new,
      binding: ViewMcPlaningBinding(),
    ),
  ];
}
