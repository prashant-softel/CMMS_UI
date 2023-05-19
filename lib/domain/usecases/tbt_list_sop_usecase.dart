
import 'package:cmms/domain/models/create_sop_model.dart';
import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/sop_list_model.dart';
import 'package:cmms/domain/repositories/repository.dart';
import 'package:cmms/domain/repositories/local_storage_keys.dart';
import 'package:flutter/services.dart';


class TBTSOPListUsecase {
  TBTSOPListUsecase(this.repository);
  Repository repository;


   Future<CreateSOPModel?> browseFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    return await repository.browseFiles(
      fileBytes,
      fileName,
      isLoading,
    );
    // return true;
  }

Future<bool> browseTBTSOPFiles(
      Uint8List? fileBytes, String fileName, bool isLoading) async {
    await repository.browseFiles(
      fileBytes,
      fileName,
      isLoading,
    );
    return true;
  }

   Future<List<JobTypeListModel>> getJobTypePermitList(
      {required bool isLoading, required int? facility_id}) async {
    return repository.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<Map<String, dynamic>> createSOP({
    createSop,
    bool? isLoading,
  }) async =>
      await repository.createSOP(
        createSop,
        isLoading,
      );


 Future<List<SOPListModel>> getSopPermitList({
    required bool isLoading,
    required int? job_type_id
   
  }) async {
    return repository.getSopPermitList(
      isLoading: isLoading,
      job_type_id: job_type_id,
  
    );
  }

  // Future<List<FacilityModel?>?> getFacilityList() async =>
  //     await repository.getFacilityList(true);
  // Future<String?> getUserAccessList() async =>
  //     await repository.getUserAccessData(LocalKeys.userAccess);



  
       
}
