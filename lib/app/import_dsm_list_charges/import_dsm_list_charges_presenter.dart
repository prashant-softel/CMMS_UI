import 'package:cmms/domain/models/SPV_list_model.dart';
import 'package:cmms/domain/models/dsm_list_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/state_model.dart';
import 'package:cmms/domain/models/type_model.dart';
import 'package:cmms/domain/usecases/import_dsm_list_charges_usecase.dart';

class ImportDsmListChargesListPresenter {
  ImportDsmListChargesListPresenter(this.importDsmListDsmChargesListUsecase);
  ImportDsmListChargesListUsecase importDsmListDsmChargesListUsecase;

  Future<List<FacilityModel?>?> getFacilityList({
    required bool isLoading,
  }) async {
    return importDsmListDsmChargesListUsecase.getFacilityList(
      isLoading: isLoading,
    );
  }

  Future<List<StateModel?>?> getStateList({
    bool? isLoading,
    int? selectedCountryId,
  }) async =>
      await importDsmListDsmChargesListUsecase.getStateList(
        isLoading: isLoading ?? false,
        selectedCountryId: selectedCountryId,
      );

  Future<List<SPVListModel?>?> getSpvList({
    required bool isLoading,
  }) async {
    return importDsmListDsmChargesListUsecase.getSpvList(
      isLoading: isLoading,
    );
  }

  Future<List<StatusModel?>?> getdsmType({
    required bool isLoading,
  }) async {
    return importDsmListDsmChargesListUsecase.getdsmType(
      isLoading: isLoading,
    );
  }

  Future<List<DSMData?>?> getDSMData(
          {List<String>? selectedYear,
          List<String>? selectedMonth,
          List<int>? selectedState,
          List<int>? selectedSpv,
          List<int>? selectedSite,
          List<int>? selectedDSMType,
          required bool isLoading,
          bool? isExport}) async =>
      await importDsmListDsmChargesListUsecase.getDSMData(
          selectedYear: selectedYear,
          selectedMonth: selectedMonth,
          selectedState: selectedState,
          selectedSpv: selectedSpv,
          selectedSite: selectedSite,
          selectedDSMType: selectedDSMType,
          isLoading: isLoading,
          isExport: isExport);
  void clearValue() async => importDsmListDsmChargesListUsecase.clearValue();
}
