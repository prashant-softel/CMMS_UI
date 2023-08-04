import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/user_access_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';

import '../models/facility_model.dart';

class ViewWarrantyClaimUsecase {
  final Repository _repository;

  ViewWarrantyClaimUsecase(this._repository);

  Future<void> generateToken() async {
    return await _repository.generateToken();
  }


   Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
    bool? isLoading,  
    required int wc_id,
  }) async =>
      await _repository.getViewWarrantyClaimDetail(
        wc_id: wc_id,
        isLoading: isLoading ?? false,
      );

  Future<List<HistoryModel>?> getWarrantyClaimHistory({
    moduleType,
    id,
    bool? isLoading,
  }) async =>
      await _repository.getHistory(
        moduleType,
        id,
        isLoading,
      );
      
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await _repository.getFacilityList(true);
  Future<String?> getUserAccessList() async =>
      await _repository.getUserAccessData(LocalKeys.userAccess);
}
