import 'package:cmms/domain/models/type_of_water_model.dart';
import 'package:cmms/domain/models/water_data_list_model.dart';
import 'package:cmms/domain/usecases/checklist_inspection_list_usecase.dart';

class ChecklistInspectionListPresenter {
  ChecklistInspectionListPresenter(this.checklistInspectionListUsecase);
  ChecklistInspectionListUsecase checklistInspectionListUsecase;

  Future<Map<String, dynamic>?> createWaterData({
    createWaterData,
    required bool isLoading,
  }) async {
    return checklistInspectionListUsecase.createWaterData(
      createWaterData: createWaterData,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> createWaterDataConsumption({
    createWaterData,
    required bool isLoading,
  }) async {
    return checklistInspectionListUsecase.createWaterData(
      createWaterData: createWaterData,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateWaterData({
    updateWaterData,
    required bool isLoading,
  }) async {
    return checklistInspectionListUsecase.updateWaterData(
      updateWaterData: updateWaterData,
      isLoading: isLoading,
    );
  }

  Future<Map<String, dynamic>?> updateWaterDataConsumption({
    updateWaterData,
    required bool isLoading,
  }) async {
    return checklistInspectionListUsecase.updateWaterData(
      updateWaterData: updateWaterData,
      isLoading: isLoading,
    );
  }

  Future<List<WaterSource>> getTypeOfWaterList({
    required bool isLoading,
    required int? facilityId,
  }) async {
    return checklistInspectionListUsecase.getTypeOfWaterList(
      isLoading: isLoading,
      facilityId: facilityId,
    );
  }

  Future<List<WaterDataList>> getWaterDataList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
    String? start_date,
    required String end_date,
  }) async {
    return checklistInspectionListUsecase.getWaterDataList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
      start_date: start_date,
      end_date: end_date,
    );
  }
}
