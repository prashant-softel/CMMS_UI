import 'package:cmms/domain/models/material_category_model.dart';
import 'package:cmms/domain/usecases/material_category_usecase.dart';

class MaterialCategoryPresenter {
  MaterialCategoryPresenter(this.materialCategoryUsecase);

  MaterialCategoryUsecase materialCategoryUsecase;

  Future<List<MaterialCategoryListModel>> getMaterialList({
    required bool isLoading,
     bool? isExport,
    required int? job_type_id,
  }) async {
    return await materialCategoryUsecase.getMaterialList(
      isLoading: isLoading,
      isExport: isExport,
      job_type_id: job_type_id,
    );
  }

  Future<bool> createMaterialCategory({
    facilitylistJsonString,
    required bool isLoading,
  }) async {
    print("Presenter: Create Facility type function.");
    return await materialCategoryUsecase.createMaterialCategory(
      facilitylistJsonString: facilitylistJsonString,
      isLoading: isLoading,
    );
  }

  Future<bool> deleteFacility(String? business_id,
      {required bool isLoading}) async {
    await materialCategoryUsecase.deleteMaterialCategory(
      business_id: business_id ?? "",
      isLoading: isLoading,
    );
    return true;
  }

  Future<bool> updateMaterialCategory({
    modulelistJsonString,
    required bool isLoading,
  }) async {
    print("Presenter: Update Material Category function.");
    materialCategoryUsecase.updateMaterialCategory(
      modulelistJsonString: modulelistJsonString,
      isLoading: isLoading,
    );
    return true;
  }

}
