import 'package:cmms/domain/domain.dart';
import 'package:cmms/domain/models/business_list_model.dart';
import 'package:cmms/domain/models/currency_list_model.dart';
import 'package:cmms/domain/models/employee_list_model.dart';
import 'package:cmms/domain/models/history_model.dart';
import 'package:cmms/domain/models/inventory_category_model.dart';
import 'package:cmms/domain/models/view_warranty_claim_model.dart';
import 'package:cmms/domain/models/warranty_claim_model.dart';
import 'package:cmms/domain/usecases/view_warranty_claim_usecase.dart';
import 'package:cmms/domain/usecases/warranty_claim_usecase.dart';

import '../../domain/models/facility_model.dart';
import '../../domain/models/user_access_model.dart';

class ViewWarrantyClaimPresenter {
  ViewWarrantyClaimPresenter(this.viewWarrantyClaimUsecase);
  ViewWarrantyClaimUsecase viewWarrantyClaimUsecase;

  Future<void> generateToken() async {
    return await viewWarrantyClaimUsecase.generateToken();
  }

   Future<ViewWarrantyClaimModel?> getViewWarrantyClaimDetail({
  
    bool? isLoading,  
    required int wc_id,
  }) async {
      return viewWarrantyClaimUsecase.getViewWarrantyClaimDetail(
        wc_id: wc_id,
        isLoading: isLoading ?? false,
      );
  }

 Future<List<HistoryModel>?> getWarrantyClaimHistory(
    moduleType,
    id,
    isLoading,
  ) async =>
      await viewWarrantyClaimUsecase.getWarrantyClaimHistory(
        moduleType: moduleType,
        id: id,
        isLoading: isLoading,
      );
      
  Future<List<FacilityModel?>?> getFacilityList() async =>
      await viewWarrantyClaimUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await viewWarrantyClaimUsecase.getUserAccessList();

  ///
}
