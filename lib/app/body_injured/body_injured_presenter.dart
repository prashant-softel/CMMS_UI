
import '../../domain/models/body_injured_model.dart';
import '../../domain/usecases/body_injured_usecase.dart';


class BodyInjuredPresenter {
  BodyInjuredPresenter(this.bodyInjuredUsecase);
  BodyInjuredUsecase bodyInjuredUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();

  Future<List<BodyInjuredModel>> getBodyInjuredList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return bodyInjuredUsecase.getBodyInjuredList(
        isLoading: isLoading, facility_id: facility_id);
  }

 Future<bool> createBodyInjured({
   bodyInjuredJsonString,
    required bool isLoading,
 }) async {
   print("presenter Create Facility type function.");
    bodyInjuredUsecase.createBodyInjured(
      bodyInjuredJsonString: bodyInjuredJsonString,
      isLoading: isLoading,
   );
    return true;
  }


 deleteBodyInjured(String? bodypart_id, {required bool isLoading}) async =>
     await bodyInjuredUsecase.deleteBodyInjured(
       bodypart_id: bodypart_id ?? 0,
       isLoading: isLoading,
     );
  Future<bool> updateBodyInjured(
      {bodyInjuredJsonString, required bool isLoading}) async {
    print("presenter");
    bodyInjuredUsecase.updateBodyInjured(
      bodyInjuredJsonString: bodyInjuredJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}