import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:cmms/domain/models/dsm_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/type_model.dart';

class ImportDsmListChargesListUsecase {
  ImportDsmListChargesListUsecase(this.repository);

  final Repository repository;

  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return repository.getFacilityList(isLoading);
  }

  Future<List<StateModel?>?> getStateList({
    bool? isLoading,
    int? selectedCountryId,
  }) async =>
      await repository.getStateListnew(
        isLoading,
        selectedCountryId,
      );

  Future<List<SPVListModel?>?> getSpvList({
    bool isLoading = true,
  }) async =>
      await repository.getSPVList(
        isLoading: isLoading,
      );

  Future<List<StatusModel?>?> getdsmType({
    bool isLoading = true,
  }) async =>
      await repository.getdsmType(
        isLoading: isLoading,
      );

  Future<List<DSMData?>?> getDSMData(
          {List<String>? selectedYear,
          List<String>? selectedMonth,
          List<int>? selectedState,
          List<int>? selectedSpv,
          List<int>? selectedSite,
          List<int>? selectedDSMType,
          bool isLoading = true,
          bool? isExport}) async =>
      await repository.getDSMData(
          selectedYear: selectedYear,
          selectedMonth: selectedMonth,
          selectedState: selectedState,
          selectedSpv: selectedSpv,
          selectedSite: selectedSite,
          selectedDSMType: selectedDSMType,
          isLoading: isLoading,
          isExport: isExport);

  void clearValue() async => repository.clearData(
        LocalKeys.importType,
      );
}
