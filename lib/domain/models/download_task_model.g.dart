// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DownloadTaskModelAdapter extends TypeAdapter<DownloadTaskModel> {
  @override
  final int typeId = 0;

  @override
  DownloadTaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DownloadTaskModel()
      ..fileName = fields[0] as String?
      ..fileUrl = fields[1] as String?
      ..downloadTaskStatus = fields[2] as String?
      ..downloadingProgress = fields[3] as int?
      ..fileThumbnail = fields[4] as String?
      ..fileSize = fields[5] as String?
      ..taskId = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, DownloadTaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.fileName)
      ..writeByte(1)
      ..write(obj.fileUrl)
      ..writeByte(2)
      ..write(obj.downloadTaskStatus)
      ..writeByte(3)
      ..write(obj.downloadingProgress)
      ..writeByte(4)
      ..write(obj.fileThumbnail)
      ..writeByte(5)
      ..write(obj.fileSize)
      ..writeByte(6)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadTaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
