import 'dart:async';

import 'package:cmms/app/app.dart';
import 'package:cmms/app/escalation_matrix_list/escalation_matrix_list_presenter.dart';
import 'package:cmms/app/navigators/app_pages.dart';
import 'package:cmms/domain/models/incident_report_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import '../../domain/models/facility_model.dart';

class EscalationMatrixListController extends GetxController {
  EscalationMatrixListController(this.escalationMatrixPresenter);
  EscalationMatrixListPresenter escalationMatrixPresenter;

  final HomeController homeController = Get.find();

 





// //Escalation Matrix List
  var incidentReportList = <IncidentReportListModel>[];


// ///Escalation Matrix List
  // RxList<EscalationMatrixListModel?> escalationMatrixList =
  //     <EscalationMatrixListModel>[].obs;



  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  Rx<String> selectedFacility = ''.obs;

//   PaginationController paginationController = PaginationController(
//     rowCount: 0,
//     rowsPerPage: 10,
//   );
  PaginationController paginationEscalationMatrixController =
      PaginationController(
    rowCount: 0,
    rowsPerPage: 10,
  );



  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;

  StreamSubscription<int>? facilityIdStreamSubscription;
  int facilityId = 0;


  ///
// int? wc_id = 0;
  @override
  void onInit() async {
    // wc_id = Get.arguments;
    // print('WC_Id:$wc_id');
    facilityIdStreamSubscription = homeController.facilityId$.listen((event) {
      facilityId = event;
      Future.delayed(Duration(seconds: 2), () {
        // getEscalationMatrixList(false);
      });
    });

    Future.delayed(Duration(seconds: 1), () {
      getFacilityList();
    });
    

    super.onInit();
  }

  Future<void> getFacilityList() async {
    final _facilityList = await escalationMatrixPresenter.getFacilityList();
    //print('Facility25:$_facilityList');
    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
      }

      selectedFacility.value = facilityList[0]?.name ?? '';
      _facilityId.sink.add(facilityList[0]?.id ?? 0);
    }
  }

 

  
  // Future<void> getEscalationMatrixList( 
  //     bool isLoading) async {
  //   escalationMatrixList.value = <EscalationMatrixListModel>[];

  //   final list = await escalationMatrixPresenter.getEscalationMatrixList(
  //       isLoading: isLoading,
  //       module: "JOB"
  //       );
  
  //   print('Escalation Matrix List:$list');
  //   for (var escalation_list in list) {
  //     escalationMatrixList.add(escalation_list);
  //   }
  //   escalationMatrixList = list;
  //   paginationEscalationMatrixController = PaginationController(
  //     rowCount: escalationMatrixList.length,
  //     rowsPerPage: 10,
  //   );
  //   update(['incident_report_list']);
  // }

  void onValueChanged(dynamic list, dynamic value) {
    print('Valuesd:${value}');
    switch (list.runtimeType) {
      case RxList<FacilityModel>:
        {
          if (value != "Please Select") {
            int facilityIndex = facilityList.indexWhere((x) => x?.name == value);

          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          } else {
            facilityId=0;
          }
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }

  // void checkForm() {

  //   if (warrantyClaimTitleTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Title Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (warrantyClaimBriefDescTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Description Field cannot be empty', timeInSecForIosWeb: 5);
  //   }
  //   if (affectedSerialNoTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Affected Serial No Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (failureDateTimeCtrlrWebBuffer == null) {
  //     Fluttertoast.showToast(
  //         msg: 'Failure Date Time Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }

  //   if (orderReferenceNoTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Order Reference No Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (costOfReplacementTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Cost of Replacement Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (immediateCorrectiveActionTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Corrective Action Field cannot be empty',
  //         timeInSecForIosWeb: 5);
  //   }
  //   if (requestManufactureTextController.text == '') {
  //     Fluttertoast.showToast(
  //         msg: 'Request Field cannot be empty', timeInSecForIosWeb: 5);
  //   }

  // }

 

  Future<void> viewEscalationMatrix({int? id}) async {
    Get.toNamed(Routes.viewEscalatiomMatrixContentWeb, arguments: id);
    print('Argument$id');
  }

  Future<void> editEscalationMatrix({int? id}) async {
    Get.toNamed(Routes.addIncidentReportContentWeb, arguments: id);
    print('Argument$id');
  }
}
