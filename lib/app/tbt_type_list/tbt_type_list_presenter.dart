import 'package:cmms/domain/models/facility_model.dart';
import 'package:cmms/domain/models/job_type_list_model.dart';
import 'package:cmms/domain/models/preventive_checklist_model.dart';
import 'package:cmms/domain/models/safety_measure_list_model.dart';
import 'package:cmms/domain/models/type_permit_model.dart';
import 'package:cmms/domain/usecases/tbt_type_list_usecase.dart';
import 'package:cmms/domain/usecases/permit_type_usecase.dart';
import 'package:cmms/domain/usecases/safety_questions_list_usecase.dart';

import '../../domain/models/frequency_model.dart';
import '../../domain/models/inventory_category_model.dart';
import '../../domain/usecases/preventive_list_usecase.dart';

class TBTTypeListPresenter {
  TBTTypeListPresenter(this.tbtTypeListUsecase);
  TBTTypeListUsecase tbtTypeListUsecase;

  Future<List<JobTypeListModel>> getJobTypePermitList({
    required bool isLoading,
    required int? facility_id,
  }) async {
    return tbtTypeListUsecase.getJobTypePermitList(
      isLoading: isLoading,
      facility_id: facility_id,
    );
  }

  Future<List<FacilityModel?>?> getFacilityList() async =>
      await tbtTypeListUsecase.getFacilityList();
  Future<String?> getUserAccessList() async =>
      await tbtTypeListUsecase.getUserAccessList();


 
 
}
