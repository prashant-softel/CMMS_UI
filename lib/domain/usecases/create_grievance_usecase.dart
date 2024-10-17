import 'package:cmms/domain/models/get_asset_data_list_model.dart';
import 'package:cmms/domain/models/grievance_List_model.dart';
import 'package:cmms/domain/models/grievance_type_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/resolution_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class CreateGrievanceUsecase {
  CreateGrievanceUsecase(this.repository);
  Repository repository;
  Future<List<GetAssetDataModel?>?> getAssetList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await repository.getAssetList(
        auth,
        facilityId,
        isLoading,
      );
  Future<Map<String, dynamic>> submitPurchaseOrderData({
    createGoReq,
    bool? isLoading,
  }) async =>
      await repository.submitPurchaseOrderData(
        createGoReq,
        isLoading,
      );
  Future<Map<String, dynamic>> updatePurchaseOrderData({
    createGoReq,
    bool? isLoading,
  }) async =>
      await repository.updatePurchaseOrderData(
        createGoReq,
        isLoading,
      );
  Future<List<HistoryModel>?> getRoHistory({
    moduleType,
    id,
    facilityId,
    bool? isLoading,
  }) async =>
      await repository.getRoHistory(
        moduleType,
        id,
        facilityId,
        isLoading,
      );

  Future<Map<String, dynamic>> saveGrievance({
    grievance,
    bool? isLoading,
  }) async =>
      await repository.saveGrievance(
        grievance,
        isLoading,
      );

  Future<List<GrievanceTypeModel?>?> getGrievanceType(bool? isLoading) async =>
      await repository.getGrievanceType(isLoading: isLoading);

       Future<List<ResolutionTypeModel?>?> getResolutionType(bool? isLoading) async =>
      await repository.getResolutionType(isLoading: isLoading);

  Future<GrievanceListModel?> getGrievanceDetails(
          {bool? isLoading, int? id}) async =>
      await repository.getGrievanceDetails(isLoading: isLoading, id: id);

  Future<Map<String, dynamic>> updateGrievanceDetails({
    grievanceJson,
    bool? isLoading,
  }) async =>
      await repository.updateGrievanceDetails(
        isLoading: isLoading,
        grievanceJson: grievanceJson,
      );

      Future<Map<String, dynamic>> closeGrievanceDetails({
    grievanceJson,
    bool? isLoading,
  }) async =>
      await repository.closeGrievanceDetails(
        isLoading: isLoading,
        grievanceJson: grievanceJson,
      );
}
