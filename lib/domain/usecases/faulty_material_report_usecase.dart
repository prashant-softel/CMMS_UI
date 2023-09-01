import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/get_faulty_material_report_model.dart';

class FaultyMaterialReportUsecase {
  final Repository _repository;

  FaultyMaterialReportUsecase(this._repository);
  Future<List<FaultyMaterialReportModel?>?> getFaultyMaterialReportList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await _repository.getFaultyMaterialReportList(
          facilityId, isLoading, startDate, endDate);
}
