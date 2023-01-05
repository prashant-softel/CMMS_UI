import 'package:hive/hive.dart';
part 'download_task_model.g.dart';

@HiveType(typeId: 0)
class DownloadTaskModel extends HiveObject {
  @HiveField(0)
  late String? fileName;

  @HiveField(1)
  late String? fileUrl;

  @HiveField(2)
  late String? downloadTaskStatus;

  @HiveField(3)
  late int? downloadingProgress;

  @HiveField(4)
  late String? fileThumbnail;

  @HiveField(5)
  late String? fileSize;

  @HiveField(6)
  late String? taskId;
}
