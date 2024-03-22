import 'package:cmms/domain/models/business_type_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import '../models/business_list_model.dart';

class BusinessTypeListUsecase {
  BusinessTypeListUsecase(this.repository);
  Repository repository;



  Future<List<BusinessTypeModel>> getBusinessTypeList({
    required int? businessType,
    // int? blockId,
    // required String categoryIds,
    // int? blockId,
    // String? categoryIds,
    required bool isLoading,
  }) async =>
      await repository.getBusinessTypeList(
        // blockId : blockId,
        // categoryIds,
        businessType: businessType,
        isLoading : isLoading,
      );


  Future<List<BusinessListModel?>?> getBusinessList({
    required int? businessType,
    required int facilityId,
    required bool isLoading,
  }) async =>
      await repository.getBusinessList(
        // blockId : blockId,
        // categoryIds,
        businessType: businessType,
        facilityId:facilityId,
        isLoading : isLoading,
      );
 
  Future<bool> createBusinessType({
    businessTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.createBusinessType(
          isLoading: isLoading, businessTypeJsonString: businessTypeJsonString);
  deleteBusinessType(
          {required Object businesstype_id, required bool isLoading}) async =>
      await repository.deleteBusinessType(
        businesstype_id,
        isLoading,
      );
  Future<bool> updateBusinessType({
    businessTypeJsonString,
    bool? isLoading,
  }) async =>
      await repository.updateBusinessType(
        isLoading: isLoading,
        businessTypeJsonString: businessTypeJsonString,
      );

}
