
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/usecases/tbt_list_sop_usecase.dart';
import 'package:cmms/domain/usecases/tbt_type_list_usecase.dart';
import 'package:flutter/services.dart';




class TBTSOPListPresenter {
  TBTSOPListPresenter(this.tbtSOPListUsecase);
  TBTSOPListUsecase tbtSOPListUsecase;

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await jobTypeListUsecase.getFacilityList();
  // Future<String?> getUserAccessList() async =>
  //     await jobTypeListUsecase.getUserAccessList();
  
  Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await tbtSOPListUsecase.browseFiles(fileBytes, fileName, isLoading);
    // return true;
  }

  Future<bool> browseTBTSOPFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    await tbtSOPListUsecase.browseTBTSOPFiles(fileBytes, fileName, isLoading);
    return true;
  }

 Future<Map<String, dynamic>?> createSOP({
     createSop,
    required bool isLoading,
  }) async {
    return tbtSOPListUsecase.createSOP(
       createSop: createSop,
      isLoading: isLoading,
    );
  }


   Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return tbtSOPListUsecase.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id,
  }) async {
    return tbtSOPListUsecase.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
    );
  }


 
 
}
