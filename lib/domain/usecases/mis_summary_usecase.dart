
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/get_statutory_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MisSummaryUseCase {
  MisSummaryUseCase(this.repository);
  final Repository repository;

 Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<GetStatutoryList>> getStatutoryDataList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
    String? start_date,
    required String end_date,
  }) async {
    return repository.getStatutoryDataList(
        isLoading: isLoading,
        facility_id: facility_id,
        start_date: start_date,
        end_date: end_date,
        isExport: isExport);
  }

  void clearValue() async => repository.clearData(LocalKeys.srId);
  void clearComplianceValue() async => repository.clearData(
        LocalKeys.compliance_id,
      );
}
