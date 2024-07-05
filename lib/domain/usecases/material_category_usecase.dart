import 'package:cmms/domain/models/material_category_model.dart';
import 'package:cmms/domain/repositories/repository.dart';

class MaterialCategoryUsecase {
  MaterialCategoryUsecase(this.repository);
  
  Repository repository;

  Future<List<MaterialCategoryListModel>> getMaterialList({
    required bool isLoading,
     bool? isExport,
    required int? job_type_id,
  }) async {
    return repository.getMaterialList(
      isLoading: isLoading,
      isExport: isExport
    );
  }

  Future<void> deleteMaterialCategory({
    required Object materialcat_id,
    required bool isLoading,
  }) async {
    await repository.deleteMaterialCategory(
      materialcat_id,
      isLoading,
    );
  }

  Future<bool> updateMaterialCategory({
     modulelistJsonString,
    required bool? isLoading,
  }) async =>
     await repository.updateMaterialCategory(
      isLoading: isLoading,
      modulelistJsonString: modulelistJsonString,
    );
  

  Future<bool> createMaterialCategory({
     facilitylistJsonString,
    required bool? isLoading,
  }) async {
    return await repository.createMaterialCategory(
      isLoading: isLoading,
      mcategorylistJsonString: facilitylistJsonString,
    );
  }
}
