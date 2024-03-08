import 'package:cmms/domain/usecases/risk_type_usecases.dart';
import 'package:cmms/domain/models/risk_type_list_model.dart';


class RiskTypeListPresenter {
  RiskTypeListPresenter(this.risktypeUsecase);
  RiskTypeUsecase risktypeUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<RiskTypeModel>> getRiskTypeList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return risktypeUsecase.getRiskTypeList(
        isLoading: isLoading, facility_id: facility_id);
  }



 Future<bool> createRiskType({
   riskTypeJsonString,
    required bool isLoading,
 }) async {
   print("presenter Create Facility type function.");
    risktypeUsecase.createRiskType(
      riskTypeJsonString: riskTypeJsonString,
      isLoading: isLoading,
   );
    return true;
  }


 deleteRiskType(String? business_id, {required bool isLoading}) async =>
     await risktypeUsecase.deleteRiskType(
       business_id: business_id ?? 0,
       isLoading: isLoading,
     );
  Future<bool> updateRiskType(
      {riskTypeJsonString, required bool isLoading}) async {
    print("presenter");
    risktypeUsecase.updateRiskType(
      riskTypeJsonString: riskTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}