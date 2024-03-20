import '../../domain/models/frequency_model.dart';
import '../../domain/usecases/frequency_list_usecase.dart';

class FrequencyListPresenter {
  FrequencyListPresenter(this.frequencyUsecase);
  FrequencylistUsecase frequencyUsecase;

  Future<List<FrequencyModel?>?> getFrequencyList({
    bool? isLoading,
  }) async =>
      await frequencyUsecase.getFrequencyList(
        isLoading: isLoading ?? false,
      );
  Future<bool> createfreq({
    freqJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    frequencyUsecase.createfreq(
      freqJsonString: freqJsonString,
      isLoading: isLoading,
    );
    return true;
  }
  //
  // deleteCkecklist(String? checklist_id, {required bool isLoading}) async =>
  //     await frequencyUsecase.deleteCkecklist(
  //       checklist_id: checklist_id ?? 0,
  //       isLoading: isLoading,
  //     );
  // Future<bool> updateChecklistNumber(
  //     {checklistJsonString, required bool isLoading, checklistId}) async {
  //   print("presenter");
  //   frequencyUsecase.updateChecklistNumber(
  //     checklistJsonString: checklistJsonString,
  //     isLoading: isLoading,
  //   );
  //   return true;
  // }
}
