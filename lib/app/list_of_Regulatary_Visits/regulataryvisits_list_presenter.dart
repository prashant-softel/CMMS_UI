import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:cmms/domain/usecases/regulataryvisits_list_usecase.dart';

class RegulataryListPresenter {
  RegulataryListPresenter(this.regulataryListUsecase);
  RegulataryListUsecase regulataryListUsecase;

  /// getVisitsAndNoticesDatalist
 Future<List<GetVisitAndNoticeList>> getVisitsAndNoticesDatalist({
    required bool isLoading,
    bool? isExport,
  }) async {
    return regulataryListUsecase.getVisitsAndNoticesDatalist(
      isLoading: isLoading,
      isExport: isExport,
    );
  }
   void clearValue() async => regulataryListUsecase.clearValue();

}
