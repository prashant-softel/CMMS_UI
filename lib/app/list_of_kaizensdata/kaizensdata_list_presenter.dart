

import 'package:cmms/domain/models/get_kaizensdata_list_model.dart';
import 'package:cmms/domain/usecases/kaizensdata_list_usecase.dart';

class KaizensDataListPresenter {
  KaizensDataListPresenter(this.kaizensdataListUsecase);

  final KaizensDataListUsecase kaizensdataListUsecase;

  Future<List<GetKaizensDataList>> getkaizensdata({
    required bool isLoading,
    bool? isExport,
  }) async {
    return kaizensdataListUsecase.getkaizensdata(
      isLoading: isLoading,
      isExport: isExport,
    );
  }
   void clearValue() async => kaizensdataListUsecase.clearValue();
}
