import 'package:cmms/domain/models/get_visitandnotice_list_model.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:cmms/domain/repositories/repository.dart';

class RegulataryListUsecase {
  RegulataryListUsecase(this.repository);
  Repository repository;

  ///getVisitsAndNoticesDatalist
 Future<List<GetVisitAndNoticeList>> getVisitsAndNoticesDatalist({
    required bool isLoading,
    bool? isExport,

  }) async {
    return repository.getVisitsAndNoticesDatalist(
      isLoading: isLoading,
      isExport: isExport,
    
    );
  }
    void clearValue() async => repository.clearData(LocalKeys.oHid);
}
