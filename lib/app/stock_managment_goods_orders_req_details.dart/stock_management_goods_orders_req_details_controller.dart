import 'package:cmms/app/stock_managment_goods_orders_req_details.dart/stock_management_goods_orders_req_details_presenter.dart';
import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';
import '../../domain/models/submit_purchase_order_data_model.dart';
import '../home/home_controller.dart';

class GoodsOrdersReqDetailController extends GetxController {
  ///
  GoodsOrdersReqDetailController(
    this.goodsOrdersReqDetailPresenter,
  );
  GoodsOrdersReqDetailPresenter goodsOrdersReqDetailPresenter;
  final HomeController homecontroller = Get.find();
  Rx<List<List<Map<String, String>>>> rowItem =
      Rx<List<List<Map<String, String>>>>([]);
  RxList<GetAssetDataModel?> assetList = <GetAssetDataModel>[].obs;
  Map<String, GetAssetDataModel> dropdownMapperData = {};
  BehaviorSubject<int> _facilityId = BehaviorSubject.seeded(0);
  Stream<int> get facilityId$ => _facilityId.stream;
  int get facilityId => _facilityId.value;
  int selectedPurchaseID = 0;

  @override
  void onInit() async {
    Future.delayed(Duration(seconds: 1), () {
      getAssetList(facilityId);
    });
    super.onInit();
  }

  Future<void> getAssetList(int _facilityId) async {
    assetList.value = <GetAssetDataModel>[];
    final _assetList = await goodsOrdersReqDetailPresenter.getAssetList(
        facilityId: facilityId);
    // print('jkncejknce:$facilityId');
    if (_assetList != null) {
      for (var asset in _assetList) {
        assetList.add(asset);
      }
      update(["AssetList"]);
    }
    addRowItem();
  }

  void addRowItem() {
    rowItem.value.add([
      {"key": "Drop_down", "value": 'Please Select'},
      {'key': "Cost", "value": ''},
      {'key': "Order", "value": ''},
    ]);
  }

  void submitPurchaseOrderData() async {
    List<SubmitItems> items = [];
    rowItem.value.forEach((element) {
      SubmitItems item = SubmitItems(
          assetItemID: dropdownMapperData[element[0]["value"]]?.id,
          type: 4, // int.tryParse(
          // dropdownMapperData[element[0]["value"]]?.asset_type ?? ""),
          assetCode: dropdownMapperData[element[0]["value"]]?.asset_code,
          cost: int.tryParse(element[1]["value"] ?? '0'),
          orderedQty: int.tryParse(element[2]["value"] ?? '0'));

      items.add(item);
      print('Create GO  req  data: $item');
    });

    SubmitPurchaseOrderDataModel submitPurchaseOrderDataModel =
        SubmitPurchaseOrderDataModel(
            id: 0, facility_id: 45, items: items, purchaseID: 1);

    var createGoReqModelJsonString = submitPurchaseOrderDataModel.toJson();
    Map<String, dynamic>? responseCreateGoModel =
        await goodsOrdersReqDetailPresenter.submitPurchaseOrderData(
      createGoReq: createGoReqModelJsonString,
      isLoading: true,
    );

    if (responseCreateGoModel == null) {
      //  CreateNewPermitDialog();
      // showAlertDialog();
    }

    print('Create GO  req  data: $createGoReqModelJsonString');
  }
}
