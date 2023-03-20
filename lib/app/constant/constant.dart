import 'package:cmms/domain/models/user_access_model.dart';
import 'package:get/get.dart';

Rx<AccessListModel> varUserAccessModel =
    AccessListModel(access_list: [], user_id: 0, user_name: "").obs;
