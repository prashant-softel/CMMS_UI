// coverage:ignore-file
part of 'app_pages.dart';

/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class Routes {
  static const splash = _Paths.splash;
  static const home = _Paths.home;
  static const jobList = _Paths.jobList;
  static const trainingCourse = _Paths.trainingCouse;
  static const jobCard = _Paths.jobCardDetails;
  static const jobDetails = _Paths.jobDetails;
  static const jobCardList = _Paths.jobCardList;
  static const addJob = _Paths.addJob;
  static const editJob = _Paths.editJob;
  static const facility = _Paths.facility;
  static const login = _Paths.login;
  static const preventive = _Paths.preventive;
  static const stockManagementDashboardScreen =
      _Paths.stockManagementDashboardScreen;
  static const stockManagementGoodsOrdersScreen =
      _Paths.stockManagementGoodsOrdersScreen;

  // Vegetation Dashboard
  static const vegetationDashboard = _Paths.vegetationDashboard;
  static const vegetationPlanListScreen = _Paths.vegetationPlanListScreen;
  static const addVegetationPlanScreen = _Paths.addVegetationPlanScreen;
  static const viewVegetationPlanScreen = _Paths.viewVegetationPlanScreen;
  static const vegExecutionListScreen = _Paths.vegExecutionListScreen;

  static const createCheckList = _Paths.createCheckList;
  static const preventiveList = _Paths.preventiveList;
  static const preventiveCheckPoint = _Paths.preventiveCheckPoint;
  static const breakdown = _Paths.breakdown;
  static const misDashboard = _Paths.misDashboard;

  static const newPermit = _Paths.newPermit;
  static const newPermitList = _Paths.newPermitList;
  static const warrantyClaimList = _Paths.warrantyClaimList;
  static const preventiveMaintenanceMapping =
      _Paths.preventiveMaintenanceMapping;
  static const calibrationList = _Paths.calibrationList;
  static const warrantyCertificatesList = _Paths.warrantyCertificatesList;

  static const CalibrationHistory = _Paths.calibrationHistory;
  static const viewWarrantyClaim = _Paths.viewWarrantyClaim;
  static const newWarrantyClaimList = _Paths.newWarrantyClaimList;
  static const warrantyClaimListWeb = _Paths.warrantyClaimListWeb;
  static const goToJobCardList = _Paths.goToJobCardList;

  static const calibrationDetail = _Paths.calibrationDetail;
  static const pmSchedule = _Paths.pmSchedule;
  static const pmTask = _Paths.pmTask;
  static const pmExecution = _Paths.pmExecution;
  static const pmExecutionView = _Paths.pmExecutionView;
  static const viewPermitWebScreen = _Paths.viewPermitWebScreen;
  static const permitTypeScreen = _Paths.permitTypeScreen;
  static const masterDashboard = _Paths.masterDashboard;
  static const pmTaskView = _Paths.pmTaskView;
  static const inventory = _Paths.inventory;
  static const inventoryList = _Paths.inventoryList;
  static const safetyQuestionsList = _Paths.safetyQuestionsList;
  static const tbtTypeListScreen = _Paths.tbtTypeListScreen;
  static const tbtSOPListScreen = _Paths.tbtSOPListScreen;
  // static const jobTypeListScreen = _Paths.jobTypeListScreen;
  // static const jobSOPListScreen = _Paths.jobSOPListScreen;
  static const assetTypeListScreen = _Paths.assetTypeListScreen;
  static const inventoryTypeListScreen = _Paths.inventoryTypeListScreen;
  static const inventoryStatusListScreen = _Paths.inventoryStatusListScreen;
  static const facilityTypeListScreen = _Paths.facilityTypeListScreen;
  static const SPVListScreen = _Paths.SPVListScreen;
  static const blockTypeListScreen = _Paths.blockTypeListScreen;
  static const Bodyinjured = _Paths.Bodyinjured;
  static const importInventory = _Paths.importInventory;
  static const userList = _Paths.userList;
  static const addUser = _Paths.addUser;
  static const viewUserDetail = _Paths.viewUserDetail;
  static const featureTypeListScreen = _Paths.featureTypeListScreen;
  static const editWarrantyClaimContentWeb = _Paths.editWarrantyClaimContentWeb;
  static const addInventoryScreen = _Paths.addInventoryScreen;
  static const viewAddInventoryScreen = _Paths.viewAddInventoryScreen;
  static const viewIncidentReportScreen = _Paths.viewIncidentReportScreen;

  static const bloodTypeListScreen = _Paths.bloodTypeListScreen;
  static const countryTypeListScreen = _Paths.countryTypeListScreen;
  static const stateTypeListScreen = _Paths.stateTypeListScreen;
  static const businessListScreen = _Paths.businessListScreen;
  static const businessTypeListScreen = _Paths.businessTypeListScreen;
  static const frequencyListScreen = _Paths.frequencyListScreen;
  static const roleListScreen = _Paths.roleListScreen;
  static const warrantyType = _Paths.warrantyType;
  static const calibrationViewScreen = _Paths.calibrationViewScreen;
  static const mrsListScreen = _Paths.mrsListScreen;
  static const scheduleCourseList = _Paths.scheduleCourseList;
  static const scheduleCourse = _Paths.scheduleCourse;

  static const updateGoodsOrdersDetailsScreen =
      _Paths.updateGoodsOrdersDetailsScreen;
  static const GoodsOrdersReqDetailsScreen = _Paths.GoodsOrdersReqDetailsScreen;
  static const viewGoodsOrders = _Paths.viewGoodsOrders;

  static const assetMasterList = _Paths.assetMasterList;
  static const addassetMaster = _Paths.addassetMaster;
  static const incidentReportListWeb = _Paths.incidentReportListWeb;
  static const addIncidentReportContentWeb = _Paths.addIncidentReportContentWeb;
  static const mrsViewScreen = _Paths.mrsViewScreen;
  static const mrsApprovalScreen = _Paths.mrsApprovalScreen;
  static const mrsIssueScreen = _Paths.mrsIssueScreen;
  static const mrsReturnScreen = _Paths.mrsReturnScreen;

  static const documentManager = _Paths.documentManager;
  static const designationScreen = _Paths.designationScreen;
  static const competencyScreen = _Paths.competencyScreen;

  static const roleAccess = _Paths.roleAccess;
  static const createMrs = _Paths.createMrs;
  static const incidentRiskType = _Paths.incidentRiskType;
  static const escalationMatrixListWeb = _Paths.escalationMatrixListWeb;
  static const addEscalatiomMatrixContentWeb =
      _Paths.addEscalatiomMatrixContentWeb;
  static const viewEscalatiomMatrixContentWeb =
      _Paths.viewEscalatiomMatrixContentWeb;

  static const inventoryCategory = _Paths.inventoryCategory;

  static const insuranceProvider = _Paths.insuranceProvider;
  static const editMrs = _Paths.editMrs;
  static const moduleCleaningDashboard = _Paths.moduleCleaningDashboard;
  static const incidentReportDashboard = _Paths.incidentReportDashboard;
  static const moduleCleaningPlanning = _Paths.moduleCleaningPlanning;
  static const roleNotification = _Paths.roleNotification;
  static const setting = _Paths.setting;
  static const moduleCleaningListPlan = _Paths.moduleCleaningListPlan;
  static const insuranceStatus = _Paths.insuranceStatus;
  static const calibrationCertificate = _Paths.calibrationCertificate;
  static const warrantyCertificate = _Paths.warrantyCertificate;
  static const moduleCleaningListExecution = _Paths.moduleCleaningListExecution;
  static const returnMrsList = _Paths.returnMrsList;
  static const issueMrsApprove = _Paths.issueMrsApprove;
  static const profile = _Paths.profile;
  static const changePassword = _Paths.changePassword;
  static const returnMrsView = _Paths.returnMrsView;
  static const approverReturnMrs = _Paths.approverReturnMrs;
  static const receiveGoodsOrders = _Paths.receiveGoodsOrders;
  static const addModuleCleaningExecutionContentWeb =
      _Paths.addModuleCleaningExecutionContentWeb;
  static const viewModuleCleaningExecutionScreen =
      _Paths.viewModuleCleaningExecutionScreen;
  static const purchaseGoodsorder = _Paths.purchaseGoodsorder;
  static const purchaseGoodsorderView = _Paths.purchaseGoodsorderView;
  static const plantStockReport = _Paths.plantStockReport;
  static const employeeStockReport = _Paths.employeeStockReport;
  static const transactionReport = _Paths.transactionReport;

  static const faultyMaterialReport = _Paths.faultyMaterialReport;
  static const createPmPlan = _Paths.createPmPlan;
  static const editReturnMrs = _Paths.editReturnMrs;
  static const pmPlanList = _Paths.pmPlanList;
  static const viewPmPlanScreen = _Paths.viewPmPlanScreen;
  static const typeofobservation = _Paths.typeofobservation;
  static const sourceofobservation = _Paths.sourceofobservation;
  static const risktypemaster = _Paths.risktypemaster;
  static const viewMcPlaning = _Paths.viewMcPlaning;
  static const print = _Paths.print;
  static const hotoListScreenContentWeb = _Paths.hotoListScreenContentWeb;
  static const auditListScreen = _Paths.auditListScreen;
  static const audit = _Paths.audit;
  static const createAudit = _Paths.createAudit;
  static const observationListScreen = _Paths.observationListScreen;
  static const createObservation = _Paths.createObservation;
  static const addCourse = _Paths.addCourse;
  static const checkListOfObservation = _Paths.checkListOfObservation;
  static const viewAuditPlan = _Paths.viewAuditPlan;
  static const statutory = _Paths.statutory;
  static const wasteData = _Paths.wasteData;
  static const checklistMisPlan = _Paths.checklistMisPlan;
  static const createMisPlan = _Paths.createMisPlan;
  static const viewMisPlan = _Paths.viewMisPlan;
  static const misTask = _Paths.misTask;
  static const waterDataListScreen = _Paths.waterDataListScreen;
  static const waterDataScreen = _Paths.waterDataScreen;
  static const complianceHistoryScreen = _Paths.complianceHistoryScreen;
  static const addWasteDataScreen = _Paths.addWasteDataScreen;

  static const complianceScreen = _Paths.complianceScreen;
  static const grievanceList = _Paths.grievanceList;
  static const addGrievance = _Paths.addGrievance;
  static const grievanceCard = _Paths.grievanceCardDetails;
  static const grievanceDetails = _Paths.grievanceDetails;
  static const grievanceCardList = _Paths.grievanceCardList;
  static const editGrievance = _Paths.editGrievance;
  static const responsibility = _Paths.responsibility;
  static const auditTask = _Paths.auditTask;
  static const addWaterData = _Paths.addWaterData;
  static const viewWaterData = _Paths.viewWaterData;
  static const viewHazWasteData = _Paths.viewHazWasteData;
  static const dsmCharges = _Paths.dsmCharges;
  static const viewAuditTask = _Paths.viewAuditTask;
}

abstract class _Paths {
  static const splash = '/splash-screen';
  static const home = '/home-screen';
  static const jobList = '/job-list-screen';
  static const trainingCouse = '/training-course';
  static const jobDetails = '/job-details-screen';
  static const addJob = '/add-job-screen';
  static const editJob = '/edit-job-screen';
  static const facility = '/facility';
  static const viewAuditTask = '/viewAuditTask';

  static const jobCardDetails = '/job-card-details';
  static const jobCardList = '/job-card-list-screen';
  static const login = '/login-screen';
  static const preventive = '/preventive-maintenance';
  static const stockManagementDashboardScreen = '/stock-management-dashboard';
  static const stockManagementGoodsOrdersScreen =
      '/stock-management-goods-orders-dashboard';

  // Vegetation Dashboard
  static const vegetationDashboard = '/vegetation-dashboard';
  static const vegetationPlanListScreen = '/vegetation-plan-list-screen';
  static const addVegetationPlanScreen = '/add-vegetation-plan';
  static const viewVegetationPlanScreen = '/view_vegetation_plan';
  static const vegExecutionListScreen =
      '/vegetation-execution-plan-list-screen';

  // static const create_checkList = '/create_preventive_checklist-screen';
  // static const preventive_List = '/preventive-list-screen';
  static const breakdown = '/breakdown-maintenance';
  static const misDashboard = '/misDashboard';
  static const scheduleCourseList = '/scheduleCourseList';
  static const scheduleCourse = '/scheduleCourse';

  static const newPermit = '/new-permit';
  static const createCheckList = '/create_preventive_checklist-screen';
  static const preventiveList =
      '/preventive-maintenance/preventive-list-screen';
  static const preventiveCheckPoint = '/preventive-check-point';
  static const newPermitList = '/permit-list';
  static const warrantyClaimList = '/warranty-claim-list';
  static const warrantyClaimListWeb = '/warranty-claim-list-web';
  static const goToJobCardList = '/job-card-list';

  static const preventiveMaintenanceMapping = '/pm-mapping-screen';
  static const calibrationList = '/calibration-list-screen';
  static const warrantyCertificatesList = '/warranty-certificates-list-screen';
  static const calibrationHistory = '/calibration-history-screen';
  static const viewWarrantyClaim = '/view-warranty-claim';
  static const newWarrantyClaimList = '/new-warranty-claim';
  static const calibrationDetail = '/calibration-detail';
  static const pmSchedule = '/pm-schedule-screen';
  static const pmTask = '/pm-task-screen';
  static const pmExecution = '/pm-execution-screen';
  static const pmExecutionView = '/pm-execution-view-screen';
  static const viewPermitWebScreen = '/view-permit-web-screen';
  static const permitTypeScreen = '/permit-type-screen';
  static const masterDashboard = '/master-dashboard';
  static const pmTaskView = '/pm-task-view-screen';
  static const inventory = '/inventory';
  static const inventoryList = '/inventoryList';
  static const safetyQuestionsList = '/permit_type-checklist-screen';
  static const tbtTypeListScreen = '/tbt-type-list-screen';
  static const tbtSOPListScreen = '/tbt-sop-list-screen';
  static const assetTypeListScreen = '/asset-type-list-screen';
  static const inventoryTypeListScreen = '/inventory-type-list-screen';
  static const inventoryStatusListScreen = '/inventory-status-list-screen';
  static const facilityTypeListScreen = '/facility-type-list-screen';
  static const SPVListScreen = '/spv-list-screen';
  static const blockTypeListScreen = '/block-type-list-screen';
  static const Bodyinjured = '/body-injured';
  static const importInventory = '/importInventory';
  static const userList = '/userList';
  static const addUser = '/addUser';
  static const viewUserDetail = '/view-user-detail';
  static const featureTypeListScreen = '/feature-Type-List-Screen';
  static const editWarrantyClaimContentWeb = '/edit-warranty-claim-content-web';
  static const bloodTypeListScreen = '/blood-Type-List-Screen';
  static const countryTypeListScreen = '/country-Type-List-Screen';
  static const stateTypeListScreen = '/state-Type-List-Screen';
  static const businessListScreen = '/business-List-Screen';
  static const businessTypeListScreen = '/business-Type-List-Screen';
  static const frequencyListScreen = '/frequency-Type-List-Screen';
  static const roleListScreen = '/role-Type-List-Screen';
  static const warrantyType = '/warranty-Type-List-Screen';
  static const addInventoryScreen = '/add-inventory-screen';
  static const viewAddInventoryScreen = '/view-add-inventory-screen';
  static const calibrationViewScreen = '/calibration-view-screen';
  static const mrsListScreen = '/mrs-list-screen';
  static const updateGoodsOrdersDetailsScreen =
      '/update-goods-orders-details-screen';
  static const GoodsOrdersReqDetailsScreen = '/goods-orders-req-details-screen';
  static const viewGoodsOrders = '/view-goods-orders';

  static const assetMasterList = '/asset-Master-List';
  static const addassetMaster = '/add-asset-Master';
  static const incidentReportListWeb = '/incident-report-list';
  static const addIncidentReportContentWeb = '/add-incident-report';
  static const mrsViewScreen = '/mrs-view';
  static const mrsApprovalScreen = '/mrs-approval';
  static const mrsIssueScreen = '/mrs-issue';
  static const mrsReturnScreen = '/mrs-return';

  static const documentManager = '/document-manager';
  static const designationScreen = '/designation-Screen';
  static const competencyScreen = '/competency-Screen';
  static const roleAccess = '/role-access';
  static const viewIncidentReportScreen = '/view-incident-report-screen';
  static const createMrs = '/Create-mrs';
  static const incidentRiskType = '/Incident-Risk-Type';
  static const escalationMatrixListWeb = '/escalation-matrix-list';
  static const addEscalatiomMatrixContentWeb = '/add-escalation-matrix';
  static const viewEscalatiomMatrixContentWeb = '/view-escalation-matrix';

  static const inventoryCategory = '/inventoryCategory';
  static const insuranceProvider = '/insuranceProvider';
  static const editMrs = '/editMrs';
  static const moduleCleaningDashboard = '/module-cleaning-dashboard';
  static const incidentReportDashboard = '/incident-report-dashboard';
  static const moduleCleaningPlanning = '/module-cleaning-planning';
  static const roleNotification = '/role-notification';
  static const setting = '/setting';
  static const moduleCleaningListPlan = '/module-cleaning-list-plan';

  static const insuranceStatus = '/insuranceStatus';
  static const calibrationCertificate = '/calibrationCertificate';
  static const warrantyCertificate = '/warrantyCertificate';
  static const moduleCleaningListExecution = '/module-cleaning-list-execution';
  static const returnMrsList = '/return-mrs';
  static const issueMrsApprove = '/issue-mrs-approve-reject';
  static const profile = '/profile';
  static const changePassword = '/changePassword';
  static const returnMrsView = '/returnMrsView';
  static const approverReturnMrs = '/approverReturnMrs';
  static const receiveGoodsOrders = '/receiveGoodsOrders';
  static const purchaseGoodsorder = '/purchaseGoodsorder';
  static const purchaseGoodsorderView = '/purchaseGoodsorderView';

  static const addModuleCleaningExecutionContentWeb =
      '/add-module-cleaning-execution';
  static const viewModuleCleaningExecutionScreen =
      '/view-module-cleaning-execution';
  static const plantStockReport = '/plant-stock-report';
  static const employeeStockReport = '/employee-stock-report';
  static const transactionReport = '/transaction-report';

  static const faultyMaterialReport = '/faulty-material-report';
  static const createPmPlan = '/createPmPlan';
  static const editReturnMrs = '/edit-return-mrs';
  static const pmPlanList = '/pm-plan-list';
  static const viewPmPlanScreen = '/view-Pm-Plan-Screen';
  static const typeofobservation = '/type-of-observation';
  static const sourceofobservation = '/source-of-observation';
  static const risktypemaster = '/risk-type-master';
  static const viewMcPlaning = '/view-mc-planing';
  static const print = '/print';
  static const hotoListScreenContentWeb = '/hoto-list-screen';
  static const auditListScreen = '/audit-list-screen';
  static const audit = '/audit';
  static const createAudit = '/create-audit';
  static const observationListScreen = '/observationListScreen';
  static const createObservation = '/createObservation';
  static const addCourse = '/addCourse';
  static const checkListOfObservation = '/checkListOfObservation';
  static const viewAuditPlan = '/viewAuditPlan';
  static const statutory = '/statutory';
  static const wasteData = '/wasteData';
  static const checklistMisPlan = '/checklistMisPlan';
  static const createMisPlan = '/createMisPlan';

  static const viewMisPlan = '/viewMisPlan';
  static const misTask = '/misTask';
  static const waterDataListScreen = '/waterDataListScreen';
  static const complianceScreen = '/complianceScreen';
  static const waterDataScreen = '/waterDataScreen';
  static const complianceHistoryScreen = '/complianceHistoryScreen';
  static const addWasteDataScreen = '/addWasteDataScreen';
  static const grievanceList = '/grievance-list';
  static const addGrievance = '/add-grievance';
  static const grievanceCardDetails = '/grievance-card-details';
  static const grievanceDetails = '/grievance-details-screen';
  static const editGrievance = '/edit-grievance-screen';
  static const grievanceCardList = '/grievance-card-list';
  static const viewHazWasteData = '/viewHazWasteData';

// static const editPermitWebScreen = '/edit-permit-web-screen';
  static const responsibility = '/responsibility';
  static const auditTask = '/auditTask';
  static const addWaterData = '/addWaterData';
  static const viewWaterData = '/viewWaterData';
  static const dsmCharges = '/dsm-charges';
}
