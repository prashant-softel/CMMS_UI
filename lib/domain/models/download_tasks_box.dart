import 'package:cmms/domain/domain.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<DownloadTaskModel> getDownloadTasks() =>
      Hive.box<DownloadTaskModel>('download_task_model');
}
