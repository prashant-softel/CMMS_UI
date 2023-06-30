// coverage:ignore-file

import 'package:cmms/app/add_inventory/add_inventory_binding.dart';
import 'package:cmms/app/add_inventory/view/add_inventory_ui.dart';

import 'package:cmms/app/add_user/add_user_binding.dart';
import 'package:cmms/app/add_user/view/add_user_screen.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/breakdown_maintenance/view/breakdown_maintenance_screen.dart';
import 'package:cmms/app/business_List/view/business_list_screen.dart';
import 'package:cmms/app/calibration/view/calibration_list_screen.dart';
import 'package:cmms/app/calibration_detail/calibration_detail_binding.dart';
import 'package:cmms/app/calibration_history/calibration_history_binding.dart';
import 'package:cmms/app/calibration_history/view/calibration_history_screen.dart';
import 'package:cmms/app/calibration_view/calibration_view_binding.dart';
import 'package:cmms/app/create_preventive_checklist/view/create_preventive_screen.dart';
import 'package:cmms/app/edit_warranty_claim/edit_%20warranty_claim_binding.dart';
import 'package:cmms/app/edit_warranty_claim/view/edit_warranty_claim_content_web.dart';
import 'package:cmms/app/incident_report_list.dart/incident_report_list_binding.dart';
import 'package:cmms/app/incident_report_list.dart/incident_report_list_screen.dart';
import 'package:cmms/app/inventory_list/inventory_list_binding.dart';
import 'package:cmms/app/mrs/mrs_list_binding.dart';
import 'package:cmms/app/mrs/view/mrs_list_screen.dart';
import 'package:cmms/app/mrs_approve/mrs_approve_binding.dart';
import 'package:cmms/app/mrs_approve/view/mrs_approve_screen.dart';
import 'package:cmms/app/mrs_issue/mrs_issue_binding.dart';
import 'package:cmms/app/mrs_issue/view/mrs_issue_screen.dart';
import 'package:cmms/app/mrs_return/mrs_return_binding.dart';
import 'package:cmms/app/mrs_return/view/mrs_return_screen.dart';
import 'package:cmms/app/mrs_view/mrs_view_binding.dart';
import 'package:cmms/app/mrs_view/view/mrs_view_screen.dart';
import 'package:cmms/app/role_access/role_access_binding.dart';
import 'package:cmms/app/role_access/view/role_access_screen.dart';
import 'package:cmms/app/stock_management/stock_management_binding.dart';
import 'package:cmms/app/stock_management/view/stock_management.screen.dart';
import 'package:cmms/app/stock_managment_goods_orders.dart/stock_management_goods_orders_binding.dart';
import 'package:cmms/app/stock_managment_goods_orders.dart/view/stock_management_goods_orders_screen.dart';
import 'package:cmms/app/stock_managment_goods_orders.dart/view/stock_management_goods_orders_web.dart';
import 'package:cmms/app/stock_managment_update_goods_orders_details.dart/view/stock_management_update_goods_orders_details_screen.dart';
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
import 'package:cmms/app/view_add_inventory/view_add_inventory_binding.dart';
import 'package:cmms/app/view_add_inventory/view_add_inventory_ui.dart';
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
import 'package:cmms/app/view_warranty_claim/view/view_warranty_claim_content_web.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_binding.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_binding.dart';
// import 'package:cmms/warranty_claim_list/warranty_claim_list_binding.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_list_screen.dart';
import 'package:cmms/app/warranty_claim_list/web/new_warranty_claim_web.dart';
import 'package:cmms/app/warranty_claim_list/web/warranty_claim_list_web.dart';
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
import '../facility/facility_binding.dart';
import '../facility/facility_view.dart';
import '../frequency_List/frequency_list_binding.dart';
import '../frequency_List/view/frequency_list_screen.dart';
import '../import_inventory/import_inventory_binding.dart';
import '../import_inventory/view/import_inventory_screen.dart';
import '../inventory/inventory_binding.dart';
import '../inventory_list/views/inventory_list_screen.dart';
import '../inventory_status_list/inventory_status_list_binding.dart';
import '../inventory_status_list/view/inventory_status_list.dart';
import '../job_card_details/job_card_details_binding.dart';
import '../job_card_details/views/job_card_details_screen.dart';
import '../job_details/job_details_binding.dart';
import '../job_details/views/job_details_screen.dart';
import '../job_list/job_list_binding.dart';
import '../job_list/views/job_list_screen.dart';
import '../login/login_binding.dart';
import '../login/view/login_screen.dart';
import '../module_List/module_list_binding.dart';
import '../module_List/view/module_list_screen.dart';
import '../permit_type/permit_type_binding.dart';
import '../permit_type/view/permit_type_screen.dart';
import '../pm_mapping/pm_mapping_binding.dart';
import '../pm_mapping/view/pm_mapping_screen.dart';
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
import '../role_List/role_list_binding.dart';
import '../state_list_screen/state_list_binding.dart';
import '../state_list_screen/view/state_list_content_screen.dart';
import '../stock_managment_update_goods_orders_details.dart/stock_management_update_goods_orders_details_binding.dart';
import '../user_list/user_list_binding.dart';
import '../user_list/view/user_list_screen.dart';
import '../role_List/view/role_list_screen.dart';
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
      name: _Paths.moduleTypeListScreen,
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
      name: _Paths.updateGoodsOrdersDetailsScreen,
      page: StockManagementUpdateGoodsOrdersDetailsScreen.new,
      binding: StockManagementGoodsOrdersDetailsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.assetMasterList,
      page: AssetMasterScreen.new,
      binding: AssetMasterBinding(),
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
      page: MrsReturnScreen.new,
      binding: MrsReturnBinding(),
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
      name: _Paths.competencyScreen,
      page: CompetencyListScreen.new,
      binding: CompetencyListBinding(),
    ),
  ];
}
