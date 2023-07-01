import 'package:cmms/domain/models/preventive_checklist_model.dart';

import '../../domain/models/business_type_model.dart';
import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/business_type_list_usecase.dart';
import '../../domain/usecases/preventive_list_usecase.dart';

class BusinessTypeListPresenter {
  BusinessTypeListPresenter(this.businesstypeListScreen);
  BusinessTypeListUsecase businesstypeListScreen;


  Future<List<BusinessTypeModel?>?> getBusinessTypeList({
    int? businessType,
    // int? type,
    bool? isLoading,
  }) async =>
      await businesstypeListScreen.getBusinessTypeList(
        businessType: businessType ?? 0,
        // type: type,
        isLoading: isLoading ?? false,
      );

  Future<bool> createBusinessType({
    businessTypeJsonString,
    required bool isLoading,
  }) async {
    print("presenter");
    businesstypeListScreen.createBusinessType(
      businessTypeJsonString: businessTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }

  deleteBusinessType(String? businesstype_id, {required bool isLoading}) async =>
      await businesstypeListScreen.deleteBusinessType(
        businesstype_id: businesstype_id ?? 0,
        isLoading: isLoading,
      );
  Future<bool> updateBusinessType(
      {businessTypeJsonString, required bool isLoading, checklistId}) async {
    print("presenter");
    businesstypeListScreen.updateBusinessType(
      businessTypeJsonString: businessTypeJsonString,
      isLoading: isLoading,
    );
    return true;
  }
}
