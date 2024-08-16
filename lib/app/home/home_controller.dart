import 'dart:async';
import 'dart:convert';
import 'package:cmms/app/app.dart';

import 'package:cmms/app/constant/constant.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class HomeController extends GetxController {
  HomeController(this.homePresenter);
  HomePresenter homePresenter;
  int facilityId = 0;
  StreamSubscription<int>? facilityIdStreamSubscription;
  RxList<int> selectedFacilityIdList = <int>[].obs;
  String categoryIds = '';
  Rx<String> selectedFacility = ''.obs;
  String username = '';
  RxList<FacilityModel?> facilityList = <FacilityModel>[].obs;
  Rx<bool> isFacilitySelected = true.obs;
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId1 => _facilityId.value;
  BehaviorSubject<String> _facilityName = BehaviorSubject.seeded('');
  Stream<String> get facilityName$ => _facilityName.stream;
  String get facilityName1 => _facilityName.value;
  Rx<int> selectedIndex = 0.obs;
  var isExpanded = false.obs;
  RxBool menuButton = false.obs;
  RxList<FacilityModel?> selectedFacilityNameList = <FacilityModel>[].obs;

  void toggleExpansion() {
    isExpanded.toggle();
  }

  @override
  void onInit() async {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () {
      getFacilityListByUserId();
    });
  }

  void clearStoreData() {
    homePresenter.clearValue();
  }

  Future<void> getFacilityListByUserId() async {
    final _facilityList = await homePresenter.getFacilityListByUserId();

    if (_facilityList != null) {
      for (var facility in _facilityList) {
        facilityList.add(facility);
        selectedFacilityIdList.add(facility?.id ?? 0);
      }
      getuserAccessData();
      final facilityData = await homePresenter.getValue();
      print({"facilityData": selectedFacilityIdList});
      Map<String, dynamic> savaData =
          facilityData != '' ? jsonDecode(facilityData ?? '{}') : {};
      selectedFacility.value = savaData['name'] ?? facilityList[0]?.name ?? '';
      print({"selected facality": selectedFacility});
      _facilityId.sink.add(savaData['id'] ?? facilityList[0]?.id ?? 0);
      _facilityName.sink.add(savaData['name'] ?? facilityList[0]?.name ?? '');
    }
  }

  Future<void> getuserAccessData() async {
    final _userAccessList = await homePresenter.getUserAcessValue();

    if (_userAccessList != null) {
      final userAccessModelList = jsonDecode(_userAccessList);
      var userAccess = AccessListModel.fromJson(userAccessModelList);
      varUserAccessModel.value = userAccess;
      varUserAccessModel.value.access_list = userAccess.access_list;
    }
  }

  void onValueChanged(dynamic list, dynamic value) {
    switch (list.runtimeType) {
      case const (RxList<FacilityModel>):
        {
          int facilityIndex = facilityList.indexWhere((x) => x?.name == value);
          selectedFacility.value = facilityList[facilityIndex]?.name ?? '';

          print({"selected facality11": selectedFacility});
          _facilityId.add(facilityList[facilityIndex]?.id ?? 0);
          _facilityName.add(facilityList[facilityIndex]?.name ?? '');
          String facilitydata = jsonEncode({
            "id": facilityList[facilityIndex]?.id,
            "name": facilityList[facilityIndex]?.name
          });
          homePresenter.saveValue(facilitydata: facilitydata);
        }
        break;

      default:
        {}
        break;
    }
  }
}
