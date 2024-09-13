import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/wc_certificate_list_model.dart';

import '../models/facility_model.dart';

class WcCertificatesListUsecase {
  Repository repository;

  WcCertificatesListUsecase(this.repository);
  Future<List<FacilityModel?>?> getFacilityList({bool? isLoading}) async =>
      await repository.getFacilityList(isLoading);
  Future<List<WcCertificatesListModel>> getwcCertifiacteList({
    required bool isLoading,
    required int? facility_id,
    bool? isExport,
  }) async {
    return repository.getwcCertifiacteList(
      isLoading: isLoading,
      facility_id: facility_id,
      isExport: isExport,
    );
  }
}
