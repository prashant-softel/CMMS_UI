import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/wc_certificate_list_model.dart';
import 'package:cmms/domain/usecases/wc_certificate_list_usecase.dart';

class WcCertificatesListPresenter {
  WcCertificatesListPresenter(this.wcCertificatesListUsecase);
  WcCertificatesListUsecase wcCertificatesListUsecase;
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await wcCertificatesListUsecase.getFacilityList(isLoading: isLoading);
  Future<List<WcCertificatesListModel>> getwcCertifiacteList({
    required bool isLoading,
    bool? isExport,
    required int? facility_id,
  }) async {
    return wcCertificatesListUsecase.getwcCertifiacteList(
        isLoading: isLoading, facility_id: facility_id, isExport: isExport);
  }
}
