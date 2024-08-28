// ignore: unused_import


import 'package:cmms/domain/models/get_occupational_list_model.dart';
import 'package:cmms/domain/usecases/create_occupationalhealth_usecase.dart';

class CreateOccupationalhealthPresenter {
  CreateOccupationalhealthPresenter(this.createOccupationalhealthUsecase);
  CreateOccupationalhealthUsecase createOccupationalhealthUsecase;


  ///

Future<Map<String, dynamic>?> createoccupational(
      {createoccupational, required bool isLoading}) async {
    return createOccupationalhealthUsecase.createoccupational(
      createoccupational: createoccupational,
      isLoading: isLoading,
    );
  }
  
   Future<Map<String, dynamic>?> updateHealthData({
    updateHealthData,
    required bool isLoading,
  }) async {
    return createOccupationalhealthUsecase.updateHealthData(
      updateHealthData: updateHealthData,
      isLoading: isLoading,
    );
  }
 
  Future<List<GetOccupationalList?>?> getHealthDatalist({int? id, bool? isLoading}) async =>
      await createOccupationalhealthUsecase.getHealthDatalist(true);
  
    void saveValue({String? healthId}) async {
    return createOccupationalhealthUsecase.saveValue(healthId: healthId);
  }
    Future<String?> getValue() async => await createOccupationalhealthUsecase.getValue();

      void clearValue() async => createOccupationalhealthUsecase.clearValue();
}
