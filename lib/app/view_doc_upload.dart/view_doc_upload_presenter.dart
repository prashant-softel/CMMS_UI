import 'package:cmms/domain/models/view_doc_upload.dart';
import 'package:cmms/domain/models/water_data_month.dart';
import 'package:cmms/domain/usecases/view_doc_upload_usecase.dart';

class ViewDocUploadPresenter {
  ViewDocUploadPresenter(this.viewDocUploadUsecase);
  ViewDocUploadUsecase viewDocUploadUsecase;

  Future<List<ViewDocUpload?>?> getDocuementListById({
    String? start_date,
    required String end_date,
    required int docUploadId,
    required int facilityID,
    String? sub_doc_name,
    bool? isLoading,
  }) async {
    return viewDocUploadUsecase.getDocuementListById(
      start_date: start_date,
      end_date: end_date,
      docUploadId: docUploadId,
      facilityID: facilityID,
      sub_doc_name: sub_doc_name,
      isLoading: isLoading ?? false,
    );
  }

  void saveValue({String? docUploadId}) async {
    return viewDocUploadUsecase.saveValue(docUploadId: docUploadId);
  }

  Future<String?> getValue() async => await viewDocUploadUsecase.getValue();
  void clearValue() async => viewDocUploadUsecase.clearValue();
}
