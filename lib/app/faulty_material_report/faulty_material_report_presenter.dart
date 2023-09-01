import 'package:cmms/domain/models/get_faulty_material_report_model.dart';

import '../../domain/usecases/faulty_material_report_usecase.dart';

class FaultyMaterialReportPresenter {
  FaultyMaterialReportPresenter(this.faultyMaterialReportUsecase);
  FaultyMaterialReportUsecase faultyMaterialReportUsecase;
  Future<List<FaultyMaterialReportModel?>?> getFaultyMaterialReportList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await faultyMaterialReportUsecase.getFaultyMaterialReportList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
}
