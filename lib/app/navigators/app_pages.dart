// coverage:ignore-file

import 'package:cmms/app/Compliance_Status/Compliance_Status_binding.dart';
import 'package:cmms/app/Compliance_Status/view/Compliance_Status_screen.dart';
import 'package:cmms/app/Course_Category/View/course_category_screen.dart';
import 'package:cmms/app/Course_Category/course_category_binding.dart';
import 'package:cmms/app/Statutory-Compliance/Statutory_Compliance_binding.dart';
import 'package:cmms/app/Statutory-Compliance/view/Statutory_Compliance_screen.dart';
import 'package:cmms/app/Statutory/statutory_binding.dart';
import 'package:cmms/app/Statutory/views/statutory_screen.dart';
import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_binding.dart';
import 'package:cmms/app/add_escalation_matrix/add_escalation_matrix_screen.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_binding.dart';
import 'package:cmms/app/add_incident_report/add_incident_report_screen.dart';
import 'package:cmms/app/add_inventory/add_inventory_binding.dart';
import 'package:cmms/app/add_inventory/view/add_inventory_ui.dart';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_binding.dart';
import 'package:cmms/app/add_module_cleaning_execution/add_module_cleaning_execution_screen.dart';
import 'package:cmms/app/add_training_course/add_course_binding.dart';
import 'package:cmms/app/add_training_course/view/add_course_screen.dart';

import 'package:cmms/app/add_user/add_user_binding.dart';
import 'package:cmms/app/add_user/view/add_user_screen.dart';
import 'package:cmms/app/add_vegetation_plan/add_vegetation_plan_binding.dart';
import 'package:cmms/app/add_vegetation_plan/view/add_vegetation_plan_screen.dart';
import 'package:cmms/app/add_waste_data/add_waste_data_binding.dart';
import 'package:cmms/app/add_waste_data/view/add_waste_data_screen.dart';
import 'package:cmms/app/add_water_data_per_day/add_water_data_binding.dart';
import 'package:cmms/app/add_water_data_per_day/view/add_water_data_screen.dart';
import 'package:cmms/app/administration_dashboard_screen/admin_dash_binding.dart';
import 'package:cmms/app/administration_dashboard_screen/view/admin_dash_screen.dart';
import 'package:cmms/app/app.dart';
import 'package:cmms/app/attendance_list/attendance_list_binding.dart';
import 'package:cmms/app/attendance_list/view/attendance_list_screen.dart';
import 'package:cmms/app/attendance_list_monthwise/attendance_monthwise_bindings.dart';
import 'package:cmms/app/attendance_list_monthwise/view/attendance_monthwise_screen.dart';
import 'package:cmms/app/attendance_screen/attendance_binding.dart';
import 'package:cmms/app/attendance_screen/view/attendance_screen.dart';
import 'package:cmms/app/audit/audit_binding.dart';
import 'package:cmms/app/audit/view/audit_screen.dart';
import 'package:cmms/app/audit_list/audit_list_binding.dart';
import 'package:cmms/app/audit_list/view/audit_list_screen.dart';
import 'package:cmms/app/audit_task/audit_task_binding.dart';
import 'package:cmms/app/audit_task/view/audit_task_screen.dart';
import 'package:cmms/app/breakdown_maintenance/view/breakdown_maintenance_screen.dart';
import 'package:cmms/app/business_List/view/business_list_screen.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_binding.dart';
import 'package:cmms/app/calender_view_dashboard/calendar_view_dashboard_screen.dart';
import 'package:cmms/app/calibration/view/calibration_list_screen.dart';
import 'package:cmms/app/calibration_detail/calibration_detail_binding.dart';
import 'package:cmms/app/calibration_history/calibration_history_binding.dart';
import 'package:cmms/app/calibration_history/view/calibration_history_screen.dart';
import 'package:cmms/app/calibration_view/calibration_view_binding.dart';
import 'package:cmms/app/careate_warranty_calim/create_warranty_claim_binding.dart';
import 'package:cmms/app/check_list_of_observation/checklist_of_observation_binding.dart';
import 'package:cmms/app/check_list_of_observation/views/checklist_of_observation_screen.dart';
import 'package:cmms/app/checklist_Inspection/view/ChecklistInsp_list_screen.dart';
import 'package:cmms/app/checklist_Inspection/ChecklistInsp_list_binding.dart';
import 'package:cmms/app/cmms_report/cmms_report_binding.dart';
import 'package:cmms/app/cmms_report/cmms_report_screen.dart';

import 'package:cmms/app/compliance/compliance_binding.dart';
import 'package:cmms/app/compliance/views/compliance_screen.dart';
import 'package:cmms/app/compliance_history/compliance_history_binding.dart';
import 'package:cmms/app/compliance_history/views/compliance_history_screen.dart';
import 'package:cmms/app/create_OccupationalHealth/views/create_occupationalhealth_screen.dart';
import 'package:cmms/app/create_audit/craete_audit_binding.dart';

import 'package:cmms/app/create_audit/view/create_audit_screen.dart';
import 'package:cmms/app/create_fueldata/create_fueldata_binding.dart';
import 'package:cmms/app/create_fueldata/views/create_fueldata_screen.dart';
import 'package:cmms/app/create_grievance/create_grievance_binding.dart';
import 'package:cmms/app/create_grievance/view/create_grievance_screen.dart';
import 'package:cmms/app/create_kaizens/create_kaizens_binding.dart';
import 'package:cmms/app/create_kaizens/views/create_kaizens_screen.dart';
import 'package:cmms/app/create_mis_plan/create_mis_plan_binding.dart';
import 'package:cmms/app/create_mis_plan/view/create_mis_plan_screen.dart';
import 'package:cmms/app/create_mrs/create_mrs_binding.dart';
import 'package:cmms/app/create_mrs/view/create_mrs_screen.dart';
import 'package:cmms/app/create_observation/views/create_observation_screen.dart';
import 'package:cmms/app/create_occupationalhealth/create_occupationalhealth_binding.dart';
import 'package:cmms/app/create_pemitstoworkTBT/create_pemitstoworkTBT_binding.dart';
import 'package:cmms/app/create_pemitstoworkTBT/views/create_pemitstoworkTBT_screen.dart';
import 'package:cmms/app/create_plantationdata/create_plantationdata_binding.dart';
import 'package:cmms/app/create_plantationdata/views/create_plantationdata_screen.dart';
import 'package:cmms/app/create_pm_plan/create_pm_plan_binding.dart';
import 'package:cmms/app/create_pm_plan/view/create_pm_plan_screen.dart';
import 'package:cmms/app/create_preventive_checklist/view/create_preventive_screen.dart';
import 'package:cmms/app/create_regulataryvisits/create_regulataryvisits_binding.dart';
import 'package:cmms/app/create_regulataryvisits/views/create_regulataryvisits_screen.dart';
import 'package:cmms/app/document_master/document_master_binding.dart';
import 'package:cmms/app/document_master/view/document_master_screen.dart';
import 'package:cmms/app/doc_upload/doc_upload_binding.dart';
import 'package:cmms/app/doc_upload/view/doc_upload_screen.dart';
import 'package:cmms/app/document_version_dashboard/doc_version_binding.dart';
import 'package:cmms/app/document_version_dashboard/doc_version_dashboard_screen.dart';
import 'package:cmms/app/dsm_charges/dsm_charges_binding.dart';
import 'package:cmms/app/dsm_charges/view/dsm_charges_screen.dart';
import 'package:cmms/app/dsm_dashboard/dsm_dashboard_binding.dart';
import 'package:cmms/app/edit_mrs/view/edit_mrs_screen.dart';
import 'package:cmms/app/edit_return_mrs/edit_return_mrs_binding.dart';
import 'package:cmms/app/edit_return_mrs/view/edit_return_mrs_screen.dart';
import 'package:cmms/app/edit_warranty_claim/edit_%20warranty_claim_binding.dart';
import 'package:cmms/app/edit_warranty_claim/view/edit_warranty_claim_content_web.dart';
import 'package:cmms/app/employee_stock_report/view/employee_stock_report_screen.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_binding.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_screen.dart';
import 'package:cmms/app/execute_course/execute_course_binding.dart';
import 'package:cmms/app/execute_course/view/execute_course_screen.dart';
import 'package:cmms/app/faulty_material_report/faulty_material_report_binding.dart';
import 'package:cmms/app/faulty_material_report/view/faulty_material_report_screen.dart';
import 'package:cmms/app/grievance_list/grievance_list_binding.dart';
import 'package:cmms/app/grievance_list/views/grievance_list_screen.dart';
import 'package:cmms/app/grievance_summary/grievance_summary_binding.dart';
import 'package:cmms/app/grievance_summary/views/grievance_summary_screen.dart';
import 'package:cmms/app/grievance_type/grievance_type_binding.dart';
import 'package:cmms/app/grievance_type/view/grievance_type_screen.dart';
import 'package:cmms/app/hoto/hoto_list_binding.dart';
import 'package:cmms/app/hoto/view/hoto_list_screen.dart';
import 'package:cmms/app/import_dsm_charges/import_dsm_charges_binding.dart';
import 'package:cmms/app/import_dsm_charges/view/import_dsm_charges_screen.dart';
import 'package:cmms/app/import_dsm_list_charges/import_dsm_list_charges_binding.dart';
import 'package:cmms/app/import_dsm_list_charges/view/import_dsm_list_charges_screen.dart';
import 'package:cmms/app/incident_report_dashboard/incident_report_binding.dart';
import 'package:cmms/app/incident_report_dashboard/view/incident_report_dashboard_screen.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_binding.dart';
import 'package:cmms/app/incident_report_list/incident_report_list_screen.dart';
import 'package:cmms/app/incident_risk_type/incident_risk_type_binding.dart';
import 'package:cmms/app/incident_risk_type/view/incident_risk_type_screen.dart';
import 'package:cmms/app/inventory_list/inventory_list_binding.dart';
import 'package:cmms/app/issue_mrs_approve_reject/issue_mrs_approve_binding.dart';
import 'package:cmms/app/list_of_PermitsTBTDataList/permitsTBT_list_binding.dart';
import 'package:cmms/app/list_of_PermitsTBTDataList/views/permitsTBT_list_screen.dart';
import 'package:cmms/app/list_of_Regulatary_Visits/regulataryvisits_list_binding.dart';
import 'package:cmms/app/list_of_Regulatary_Visits/views/regulataryvisits_list_screen.dart';
import 'package:cmms/app/list_of_fueldata/fueldata_list_binding.dart';
import 'package:cmms/app/list_of_fueldata/views/fueldata_list_list_screen.dart';
import 'package:cmms/app/list_of_kaizensdata/kaizensdata_list_binding.dart';
import 'package:cmms/app/list_of_kaizensdata/views/kaizensdata_list_list_screen.dart';
import 'package:cmms/app/list_of_occupationalhealth/occupational_list_binding.dart';
import 'package:cmms/app/list_of_occupationalhealth/views/occupational_list_screen.dart';
import 'package:cmms/app/list_of_plantation/plantation_list_binding.dart';
import 'package:cmms/app/list_of_plantation/views/plantation_list_list_screen.dart';
import 'package:cmms/app/master_responsibility/responsivility_binding.dart';
import 'package:cmms/app/master_responsibility/view/responsivility_screen.dart';
import 'package:cmms/app/material_category/material_category_binding.dart';
import 'package:cmms/app/material_category/view/material_category_screen.dart';
import 'package:cmms/app/mis/mis_dashboard_binding.dart';
import 'package:cmms/app/mis/view/mis_dashboard_screen.dart';
import 'package:cmms/app/mis_list_of_observation/observation_list_binding.dart';
import 'package:cmms/app/mis_list_of_observation/views/observation_list_screen.dart';
import 'package:cmms/app/mis_summary/mis_summary_binding.dart';
import 'package:cmms/app/mis_summary/views/mis_summary_screen.dart';
import 'package:cmms/app/mis_task/mis_task_binding.dart';
import 'package:cmms/app/mis_task/view/mis_task_screen.dart';
import 'package:cmms/app/module_cleaning_dashboard/module_binding.dart';
import 'package:cmms/app/module_cleaning_execution/module_cleaning_list_execution_binding.dart';
import 'package:cmms/app/module_cleaning_execution/view/module_cleaning_list_execution_screen.dart.dart';
import 'package:cmms/app/module_cleaning_list_plan/module_cleaning_list_plan_binding.dart';
import 'package:cmms/app/module_cleaning_list_plan/view/module_cleaning_list_planning_screen.dart';

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
import 'package:cmms/app/new_permit/view/create_permit_screen.dart';
import 'package:cmms/app/plant_stock_report_details/plant_stock_report_binding_details.dart';
import 'package:cmms/app/plant_stock_report_details/view/plant_stock_report_screen_details.dart';
import 'package:cmms/app/observation_summary/observation_summary_binding.dart';
import 'package:cmms/app/observation_summary/views/observation_summary_screen.dart';
import 'package:cmms/app/pm_plan_list/pm_plan_list_binding.dart';
import 'package:cmms/app/request_goods_orders_list.dart/request_goods_orders_list_binding.dart';
import 'package:cmms/app/risk_type/risk_type_binding.dart';
import 'package:cmms/app/risk_type/view/risk_type_screen.dart';
import 'package:cmms/app/schedule_course/View/schedule_course_screen.dart';
import 'package:cmms/app/schedule_course/schedule_course_binding.dart';
import 'package:cmms/app/schedule_course_list/schedule_course_list_binding.dart';
import 'package:cmms/app/schedule_course_list/view/schedule_course_list_screen.dart';
import 'package:cmms/app/targeted_group/View/targeted_group_screen.dart';
import 'package:cmms/app/targeted_group/targeted_group_binding.dart';
import 'package:cmms/app/tool_type/tool_type_binding.dart';
import 'package:cmms/app/tool_type/views/tool_type_screen.dart';
import 'package:cmms/app/training_courses/training_course_binding.dart';
import 'package:cmms/app/training_courses/views/training_course_screen.dart';
import 'package:cmms/app/training_report/training_summary_binding.dart';
import 'package:cmms/app/training_report/views/training_summary_screen.dart';
import 'package:cmms/app/transaction_report/view/transaction_report_list_screen.dart';
import 'package:cmms/app/type_water_master/type_water_master_binding.dart';
import 'package:cmms/app/type_water_master/view/type_water_master_screen.dart';
import 'package:cmms/app/veg_execution_screen/veg_execution_screen_binding.dart';
import 'package:cmms/app/veg_execution_screen/view/veg_execution_screen.dart';
import 'package:cmms/app/vegetation_control/vegetation_binding.dart';
import 'package:cmms/app/vegetation_control/view/vegetation_dashboard_screen.dart';
import 'package:cmms/app/vegetation_execution_plan_list/veg_execution_list_binding.dart';
import 'package:cmms/app/vegetation_execution_plan_list/view/veg_execution_list_screen.dart';
import 'package:cmms/app/vegetation_plan_list/vegetation_plan_list_binding.dart';
import 'package:cmms/app/vegetation_plan_list/view/vegetation_plan_list_screen.dart';
import 'package:cmms/app/view_audit_plan/view_audit_plan_binding.dart';
import 'package:cmms/app/view_course/view/view_course_screen.dart';
import 'package:cmms/app/view_course/view_course_binding.dart';
import 'package:cmms/app/view_doc_upload.dart/view/view_doc_upload_screen.dart';
import 'package:cmms/app/view_doc_upload.dart/view_doc_upload_binding.dart';
import 'package:cmms/app/view_haz_waste_data.dart/view/view_haz_waste_data_screen.dart';
import 'package:cmms/app/view_haz_waste_data.dart/view_haz_waste_data_binding.dart';
import 'package:cmms/app/view_mc_plan/view/view_mc_planning_screen.dart';
import 'package:cmms/app/view_mc_plan/view_mc_planning_binding.dart';
import 'package:cmms/app/view_mis_plan/view/view_mis_plan_screen.dart';
import 'package:cmms/app/view_mis_plan/view_mis_plan_binding.dart';
import 'package:cmms/app/view_observation/view_observation_binding.dart';
import 'package:cmms/app/view_observation/views/view_observation_screen.dart';
import 'package:cmms/app/view_permit/new_view_permit_binding.dart';
import 'package:cmms/app/view_permit/view/view_permit_screen.dart';
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
import 'package:cmms/app/inventory/view/inventory_screen.dart';

import 'package:cmms/app/preventive_check_point/preventive_check_point_binding.dart';
import 'package:cmms/app/preventive_check_point/view/preventive_check_point_screen.dart';
import 'package:cmms/app/preventive_maintanance/preventive_maintenance_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_binding.dart';
import 'package:cmms/app/new_permit_list/new_permit_list_screen.dart';
import 'package:cmms/app/view_pm_plan/view_pm_plan_binding.dart';
import 'package:cmms/app/view_veg_execution/view/view_veg_execution_screen.dart';
import 'package:cmms/app/view_veg_execution/view_veg_execution_binding.dart';
import 'package:cmms/app/view_vegetation_plan/view/view_veg_plan_screen.dart';
import 'package:cmms/app/view_vegetation_plan/view_veg_plan_binding.dart';
import 'package:cmms/app/view_warranty_claim/view/view_warranty_claim_content_web.dart';
import 'package:cmms/app/view_warranty_claim/view_warranty_claim_binding.dart';
import 'package:cmms/app/view_waste_data/view/view_waste_data_screen.dart';
import 'package:cmms/app/view_waste_data/view_waste_data_binding.dart';
import 'package:cmms/app/view_water_data/view/view_water_data_screen.dart';
import 'package:cmms/app/view_water_data/view_water_data_binding.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_binding.dart';
import 'package:cmms/app/warranty_certificates_list/warranty_certificates_list_screen.dart';
import 'package:cmms/app/warranty_claim_list/warranty_claim_binding.dart';
import 'package:cmms/app/careate_warranty_calim/view/create_warranty_claim_web.dart';
import 'package:cmms/app/waste_data/views/waste_data_screen.dart';
import 'package:cmms/app/waste_data/waste_data_binding.dart';
import 'package:cmms/app/waste_type_master/view/waste_type_master_screen.dart';
import 'package:cmms/app/waste_type_master/waste_type_master_binding.dart';
import 'package:cmms/app/water_data/view/water_data_screen.dart';
import 'package:cmms/app/water_data/water_data_binding.dart';
import 'package:cmms/app/water_data_list/view/water_data_list_screen.dart';
import 'package:cmms/app/water_data_list/water_data_list_binding.dart';
import 'package:cmms/app/work_type/view/work_type_screen.dart';
import 'package:cmms/app/work_type/work_type_binding.dart';
import 'package:cmms/app/view_compliance/view_compliance_binding.dart';
import 'package:cmms/app/view_compliance/views/view_compliance_screen.dart';
import '../approve_return_mrs/approve_return_mrs_binding.dart';
import '../approve_return_mrs/view/approve_return_mrs_screen.dart';
import '../body_injured/body_injured_binding.dart';
import '../body_injured/views/body_injured_screen.dart';
import '../calibration_certificate/calibration_certificate_binding.dart';
import '../calibration_certificate/view/calibration_certificate_screen.dart';
import '../change_password/change_password_binding.dart';
import '../change_password/view/change_password_screen.dart';
import '../create_observation/create_observation_binding.dart';
import '../dsm_dashboard/dsm_dashboard_screan.dart';
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
import '../doc_upload_list/doc_upload_list_binding.dart';
import '../doc_upload_list/view/doc_upload_list_screen.dart';
import '../edit_job/edit_job_binding.dart';
import '../edit_job/views/edit_job_screen.dart';
import '../edit_mrs/edit_mrs_binding.dart';
import '../facility/facility_binding.dart';
import '../facility/facility_view.dart';
import '../frequency_List/frequency_list_binding.dart';
import '../frequency_List/view/frequency_list_screen.dart';
import '../import_inventory/import_inventory_binding.dart';
import '../import_inventory/view/import_inventory_screen.dart';
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
import '../preventive_maintenance_task/preventive_maintenance_task_binding.dart';
import '../preventive_maintenance_task/view/preventive_maintenance_task_screen.dart';
import '../request_goods_orders_list.dart/view/request_goods_orders__list_screen.dart';

import '../source_of_observation/source_of_obs_binding.dart';
import '../source_of_observation/view/source_of_obs_screen.dart';
import '../transaction_report/transaction_report_list_binding.dart';
import '../type_of_observation/type_of_obs_binding.dart';
import '../type_of_observation/view/type_of_obs_screen.dart';
import '../view_audit_plan/view/view_audit_plan_screen.dart';
import '../view_audit_task/view/view_audit_task_screen.dart';
import '../view_audit_task/view_audit_task_binding.dart';
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
import 'package:cmms/app/new_permit/new_binding.dart';

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
      name: _Paths.trainingCouse,
      page: TrainingCourseScreen.new,
      binding: TrainingBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewCourse,
      page: ViewCourseScreen.new,
      binding: ViewCourseBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.trainingCouse,
      page: TrainingCourseScreen.new,
      binding: TrainingBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.scheduleCourseList,
      page: ScheduleCourseScreen.new,
      binding: ScheduleCourseListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.scheduleCourse,
      page: ScheduleScreen.new,
      binding: ScheduleBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.executeCourse,
      page: ExecuteCourseScreen.new,
      binding: ExecuteCourseBinding(),
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
      name: _Paths.createPermit,
      page: CreatePermitScreen.new,
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
      binding: WarrantyClaimBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.calibrationList,
      page: CalibrationListScreen.new,
      binding: CalibrationListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.warrantyCertificatesList,
      page: WarrantyCertificatesListScreen.new,
      binding: WarrantyCertificatesListBinding(),
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
        name: _Paths.misDashboard,
        page: MisDashboardScreen.new,
        binding: MisDashboardBinding()),
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
        name: _Paths.newWarrantyClaimList,
        page: NewWarrantyClaimWeb.new,
        binding: WarrantyClaimBinding()),
    GetPage<dynamic>(
        name: _Paths.createWarrantyClaimList,
        page: CreateWarrantyClaimWeb.new,
        binding: CreateWarrantyClaimBinding()),
    GetPage<dynamic>(
        name: _Paths.warrantyClaimListWeb,
        page: WarrantyClaimListScreen.new,
        binding: WarrantyClaimBinding()),

    // GetPage<dynamic>(
    //     name: _Paths.viewPermitWebScreen,
    //     page: ViewPermitWebScreen.new,
    //     binding: ViewPermitBinding()),

    GetPage<dynamic>(
        name: _Paths.viewPermitScreen,
        page: ViewPermitScreen.new,
        binding: NewViewPermitBinding()),

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

    // Vegetation Dashboard
    GetPage<dynamic>(
        name: _Paths.vegetationDashboard,
        page: VegetationDashboardScreen.new,
        binding: VegetationDashboardBinding()),
    GetPage<dynamic>(
      name: _Paths.vegetationPlanListScreen,
      page: VegetationListPlanScreen.new,
      binding: VegetationPlanListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addVegetationPlanScreen,
      page: AddVegetationPlanScreen.new,
      binding: AddVegetationPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewVegetationPlanScreen,
      page: ViewVegPlanScreen.new,
      binding: ViewVegPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.vegExecutionListScreen,
      page: VegExecutionListScreen.new,
      binding: VegExecutionListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewVegExecutionPlanScreen,
      page: ViewVegExecutionScreen.new,
      binding: ViewVegExecutionBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.vegExecutionScreen,
      page: VegExecutionScreen.new,
      binding: VegExecutionBinding(),
    ),
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
      name: _Paths.incidentReportDashboard,
      page: IncidentReportDashboardScreen.new,
      binding: IncidentReportDashboardBinding(),
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
      name: _Paths.plantStockReportDetails,
      page: PlantStockReportDetailsScreen.new,
      binding: PlantStockReportDetailsBinding(),
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
      name: _Paths.viewMcPlaning,
      page: ViewMcPlaningScreen.new,
      binding: ViewMcPlaningBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createAudit,
      page: CreateAuditScreen.new,
      binding: CreateAuditBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.observationListScreen,
      page: ObservationListScreen.new,
      binding: ObservationListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createObservation,
      page: CreateObservationScreen.new,
      binding: CreateObservationBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addCourse,
      page: AddCourseScreen.new,
      binding: AddCourseBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.checkListOfObservation,
      page: CheckListOfObservationScreen.new,
      binding: CheckListOfObservationBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.viewAuditPlan,
      page: ViewAuditPlanScreen.new,
      binding: ViewAuditPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.statutory,
      page: StatutoryScreen.new,
      binding: StatutoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.wasteData,
      page: WasteDataScreen.new,
      binding: WasteDataBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.misTask,
      page: MisTaskScreen.new,
      binding: MisTaskBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.createMisPlan,
      page: CreateMisPlanScreen.new,
      binding: CreateMisPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewMisPlan,
      page: ViewMisPlanScreen.new,
      binding: ViewMisPlanBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.waterDataListScreen,
      page: WaterDataListScreen.new,
      binding: WaterDataListBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.waterDataScreen,
      page: WaterDataScreen.new,
      binding: WaterDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.complianceScreen,
      page: ComplianceScreen.new,
      binding: ComplianceBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.complianceHistoryScreen,
      page: ComplianceHistoryScreen.new,
      binding: ComplianceHistoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addWasteDataScreen,
      page: AddWasteDataScreen.new,
      binding: AddWasteDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.responsibility,
      page: ResponsibilityListScreen.new,
      binding: ResponsibilityListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.auditTask,
      page: AuditTaskScreen.new,
      binding: AuditTaskBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.addWaterData,
      page: AddWaterDataScreen.new,
      binding: AddWaterDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewWaterData,
      page: ViewWaterDataScreen.new,
      binding: ViewWaterDataBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.viewWasteData,
      page: ViewWasteDataScreen.new,
      binding: ViewWasteDataBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.grievanceList,
      page: GrievanceListScreen.new,
      binding: GrievanceListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.grievanceSummary,
      page: GrievanceSummaryScreen.new,
      binding: GrievanceSummaryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewHazWasteData,
      page: ViewHazWasteDataScreen.new,
      binding: ViewHazWasteDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.grievanceType,
      page: GrievanceTypeScreen.new,
      binding: GrievanceTypeBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.addGrievance,
      page: CreateGrievancesScreen.new,
      binding: CreateGrievanceBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.risktypemaster,
      page: RiskTypeListScreen.new,
      binding: RiskTypeListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.Bodyinjured,
      page: BodyInjuredScreen.new,
      binding: BodyInjuredBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewAuditTask,
      page: ViewAuditTaskScreen.new,
      binding: ViewAuditTaskBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.dsmCharges,
      page: DsmChargesListScreen.new,
      binding: DsmChargesListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.incidentRiskType,
      page: IncidentRiskTypeScreen.new,
      binding: IncidentRiskTypeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.worktype,
      page: WorkTypeScreen.new,
      binding: WorkTypeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.tooltype,
      page: ToolTypeScreen.new,
      binding: ToolTypeBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.importDsmListChargesListScreen,
      page: ImportDsmListChargesListScreen.new,
      binding: ImportDsmListChargesListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.importDsmChargesScreen,
      page: ImportDsmChargesScreen.new,
      binding: ImportDsmChargesBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.dsmDashboardScreen,
      page: DsmDashboard.new,
      binding: DsmDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.waterTypeMaster,
      page: WaterTypeMasterScreen.new,
      binding: WaterTypeMasterBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.wasteTypeMaster,
      page: WasteTypeMasterScreen.new,
      binding: WasteTypeMasterBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.admin_dashboard,
      page: AdminDashboardScreen.new,
      binding: AdminDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.attendanceScreen,
      page: AttendanceScreen.new,
      binding: AttendanceBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.attendanceListScreen,
      page: AttendanceListScreen.new,
      binding: AttendanceListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.attendanceListMonthwise,
      page: AttendanceListMonthScreen.new,
      binding: AttendanceListMonthBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.materialCategory,
      page: MaterialCategoryScreen.new,
      binding: MAterialCategoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.courseCategory,
      page: CourseCategoryScreen.new,
      binding: CourseCategoryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.targetedGroup,
      page: TargetedGroupScreen.new,
      binding: TargetedGroupBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.StatutoryCompliance,
      page: StatutoryComplianceScreen.new,
      binding: StatutoryComplianceBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.documentUploadScreen,
      page: DocumentUploadScreen.new,
      binding: DocumentUploadBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewComplianceScreen,
      page: ViewComplianceScreen.new,
      binding: ViewComplianceBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.docVersionDashboard,
      page: DocVersionDashboardScreen.new,
      binding: DocVersionDashbordBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewDocUploadScreen,
      page: ViewDocUploadScreen.new,
      binding: ViewDocUploadBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.ComplianceStatus,
      page: ComplianceStatusScreen.new,
      binding: ComplianceStatusBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.DocumentMaster,
      page: DocumentMasterScreen.new,
      binding: DocumentMasterBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewObservationScreen,
      page: ViewObservationScreen.new,
      binding: ViewObservationBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.checklistInspection,
      page: ChecklistInspectionListScreen.new,
      binding: ChecklistInspectionListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.observationSummary,
      page: ObservationSummaryScreen.new,
      binding: ObservationSummaryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.misSummary,
      page: MisSummaryScreen.new,
      binding: MisSummaryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.trainingSummary,
      page: TrainingSummaryScreen.new,
      binding: TrainingSummaryBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.docVersionDashboard,
      page: DocVersionDashboardScreen.new,
      binding: DocVersionDashbordBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.viewDocUploadScreen,
      page: ViewDocUploadScreen.new,
      binding: ViewDocUploadBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createOccupationalScreen,
      page: CreateOccupationalScreen.new,
      binding: CreateOccupationalBinding(),
    ),

    GetPage<dynamic>(
      name: _Paths.occupationalDataListScreen,
      page: OccupationalDataListScreen.new,
      binding: OccupationalDataListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.regulataryDataListScreen,
      page: RegulataryDataListScreen.new,
      binding: RegulataryDataListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createRegulataryVisitsScreen,
      page: RegulataryVisitsScreen.new,
      binding: RegulataryVisitsBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createPermitsTBTScreen,
      page: PermitsTBTScreen.new,
      binding: PermitsTBTBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.permitsTBTDataListScreen,
      page: PermitsTBTDataListScreen.new,
      binding: PermitsTBTDataListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createFuelDataScreen,
      page: FuelDataScreen.new,
      binding: FuelDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.createplantationdataScreen,
      page: PlantationDataScreen.new,
      binding: PlantationDataBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.calendarViewDashbord,
      page: CalendarViewDashbordScreen.new,
      binding: CalendarViewDashbordBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.cmmsReport,
      page: CmmsReportDashboardScreen.new,
      binding: CmmsReportDashboardBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.fueldataListScreen,
      page: FuelDataListScreen.new,
      binding:  FuelDataListBinding(),
    ),
    GetPage<dynamic>(
      name: _Paths.plantationlistScreen,
      page: PlantationListScreen.new,
      binding:  PlantationListBinding(),
    ),
    
    GetPage<dynamic>(
      name: _Paths.createkaizensScreen,
      page: KaizensScreen.new,
      binding:  KaizensBinding(),
    ),
    
    GetPage<dynamic>(
      name: _Paths.kaizensListScreen,
      page: KaizensListScreen.new,
      binding:  KaizensListBinding(),
    ),
    
  ];
}
