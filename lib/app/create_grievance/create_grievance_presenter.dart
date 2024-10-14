import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/resolution_type_model.dart';
import 'package:cmms/domain/usecases/create_grievance_usecase.dart';

class CreateGrievancePresenter {
  CreateGrievancePresenter(this.createGrievanceUsecase);
  CreateGrievanceUsecase createGrievanceUsecase;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await createGrievanceUsecase.getAssetList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

  Future<List<GrievanceTypeModel?>?> getGrievanceType() async =>
      await createGrievanceUsecase.getGrievanceType(true);

  Future<List<ResolutionTypeModel?>?> getResolutionType() async =>
  await createGrievanceUsecase.getResolutionType(true);

  Future<List<HistoryModel>?> getRoHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await createGrievanceUsecase.getRoHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
  Future<Map<String, dynamic>?> submitPurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return createGrievanceUsecase.submitPurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updatePurchaseOrderData({
    createGoReq,
    required bool isLoading,
  }) async {
    return createGrievanceUsecase.updatePurchaseOrderData(
      createGoReq: createGoReq,
      isLoading: isLoading,
    );
  }

  // void saveValue({String? roId}) async {
  //   return createGrievanceUsecase.saveValue(roId: roId);
  // }

  // Future<String?> getValue() async => await createGrievanceUsecase.getValue();

  Future<Map<String, dynamic>?> saveGrievance({
    grievance,
    required bool isLoading,
  }) async {
    return createGrievanceUsecase.saveGrievance(
      grievance: grievance,
      isLoading: isLoading,
    );
  }

  Future<GrievanceListModel?> getGrievanceDetails({int? id, bool? isLoading}) async =>
      await createGrievanceUsecase.getGrievanceDetails(id: id, isLoading: isLoading);


  Future<Map<String, dynamic>>  updateGrievanceDetails({
    grievanceJson,
    bool? isLoading,
  }) async {
     return createGrievanceUsecase.updateGrievanceDetails(
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>>  closeGrievanceDetails({
    grievanceJson,
    bool? isLoading,
  }) async {
     return createGrievanceUsecase.closeGrievanceDetails(
      grievanceJson: grievanceJson,
      isLoading: isLoading,
    );
  }
}
