import 'package:cmms/domain/models/block_model.dart';
import 'package:cmms/domain/models/employee_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/models/work_type_model.dart';
import 'package:cmms/domain/repositories/repositories.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/breakdown_usecase.dart';
import 'package:cmms/domain/usecases/new_permit_usecase.dart';

import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';
import '../domain/usecases/breakdown_usecase.dart';

class NewPermitPresenter {
 NewPermitPresenter(this.newPermitUsecase);
  NewPermitUsecase newPermitUsecase;


   Future<List<BlockModel?>?> getBlocksList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getBlocksList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

   Future<List<EmployeeModel?>?> getAssignedToList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getAssignedToList(
        auth: auth ?? "",
        facilityId: facilityId ?? 0,
        isLoading: isLoading ?? false,
      );

   Future<List<WorkTypeModel?>?> getWorkTypeList({
    String? auth,
    String? categoryIds,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getWorkTypeList(
        categoryIds: categoryIds,
        isLoading: isLoading ?? false,
      );



   Future<List<FacilityModel?>?> getFacilityLists() async =>
      await newPermitUsecase.getFacilityLists(true);

   Future<List<TypePermitModel?>?> getTypePermitList() async =>
      await newPermitUsecase.getTypePermitList(true);

  Future<List<InventoryCategoryModel?>?> getInventoryCategoryList({
    String? auth,
    int? facilityId,
    bool? isLoading,
  }) async =>
      await newPermitUsecase.getInventoryCategoryList(
      );
  // Future<void> createCheckList({
  //   bool? isLoading,
  // }) async =>
  //     await newPermitUsecase.createCheckList(isLoading: isLoading);

  Future<Map<String, dynamic>?> createNewPermit({
     newPermit,
    required bool isLoading,
  }) async {
    return newPermitUsecase.createNewPermit(
       newPermit: newPermit,
      isLoading: isLoading,
    );
  }

}


