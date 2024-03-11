import 'package:cmms/domain/models/get_mrs_list_model.dart';
import 'package:cmms/domain/usecases/mrs_list_usecase.dart';

class MrsListPresenter {
  MrsListPresenter(this.mrsListUsecase);
  MrsListUsecase mrsListUsecase;
  Future<List<MrsListModel?>?> getMrsList(
          {int? facilityId,
          bool? isLoading,
          dynamic endDate,
          dynamic startDate}) async =>
      await mrsListUsecase.getMrsList(
          facilityId: facilityId ?? 0,
          isLoading: isLoading ?? false,
          endDate: endDate,
          startDate: startDate);
  void clearValue() async => mrsListUsecase.clearValue();
  void clearpmTaskValue() async => mrsListUsecase.clearpmTaskValue();
  void clearStoreTaskData() {
    mrsListUsecase.clearStoreTaskData();
  }

  void clearStoreTaskActivityData() {
    mrsListUsecase.clearStoreTaskActivityData();
  }

  void clearStoreTaskfromActorData() {
    mrsListUsecase.clearStoreTaskfromActorData();
  }

  void clearStoreTasktoActorData() {
    mrsListUsecase.clearStoreTasktoActorData();
  }

  void clearStoreTaskWhereUsedData() {
    mrsListUsecase.clearStoreTaskWhereUsedData();
  }

  void clearStoreDataJobId() async => mrsListUsecase.clearStoreDataJobId();
  void clearPermitStoreData() async => mrsListUsecase.clearPermitStoreData();
}
