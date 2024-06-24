import 'package:cmms/domain/models/veg_execution_details_model.dart';
import 'package:cmms/domain/models/veg_task_equipment_model.dart';
import 'package:cmms/domain/usecases/veg_execution_screen_usecase.dart';

class VegExecutionPresenter {
  VegExecutionPresenter(this.vegExecutionUsecase);
  VegExecutionUsecase vegExecutionUsecase;

  Future<VegExecutionDetailsModel?> getVegExecutionDetail({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return vegExecutionUsecase.getVegExecutionDetail(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<List<VegTaskEquipmentList?>> getVegTaskEquipmentList({
    bool? isLoading,
    required int facilityId,
    required int executionId,
  }) async {
    return vegExecutionUsecase.getVegTaskEquipmentList(
      executionId: executionId,
      facilityId: facilityId,
      isLoading: isLoading ?? false,
    );
  }

  Future<void> startVegExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await vegExecutionUsecase.startVegExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<void> endVegExecutionButton({
    int? executionId,
    bool? isLoading,
  }) async =>
      await vegExecutionUsecase.endVegExecutionButton(
        executionId: executionId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> abandonVegExecutionButton({
    abandoneJsonString,
    required bool isLoading,
  }) async {
    return vegExecutionUsecase.abandonVegExecutionButton(
      abandoneJsonString: abandoneJsonString,
      isLoading: isLoading,
    );
  }

  Future<void> startVegExecutionScheduleButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await vegExecutionUsecase.startVegExecutionScheduleButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

  Future<void> endVegScheduleExecutionButton({
    int? scheduleId,
    bool? isLoading,
  }) async =>
      await vegExecutionUsecase.endVegScheduleExecutionButton(
        scheduleId: scheduleId,
        isLoading: isLoading ?? false,
      );

  Future<Map<String, dynamic>?> abandonVegScheduleButton({
    abandoneScheduleJsonString,
    required bool isLoading,
  }) async {
    return vegExecutionUsecase.abandonVegScheduleButton(
      abandoneScheduleJsonString: abandoneScheduleJsonString,
      isLoading: isLoading,
    );
  }

  void savePlanId({String? vegid}) async =>
      vegExecutionUsecase.savePlanId(vegid: vegid);
  Future<String?> getPlanId() async => await vegExecutionUsecase.getPlanId();
  void saveExecutionId({String? vegexe}) async =>
      vegExecutionUsecase.saveExecutionId(vegexe: vegexe);
  Future<String?> getExecutionId() async =>
      await vegExecutionUsecase.getExecutionId();
  void clearExecutionId() => vegExecutionUsecase.clearExecutionId();
  void clearPlanId() => vegExecutionUsecase.clearPlanId();
}
