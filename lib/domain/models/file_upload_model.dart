import 'dart:html' as html;

class FileUploadModelWeb {
  //List<PlatformFile> filesWeb;
  List<html.File?> files;
  int? facilityId;
  int? moduleId;
  int? id;

  ///
  FileUploadModelWeb({
    this.facilityId,
    this.moduleId,
    this.id,
    required this.files,
    //this.filesWeb,
  });

  ///
}

///
enum FileUploadEvents { BEFORE, DURING, AFTER }
