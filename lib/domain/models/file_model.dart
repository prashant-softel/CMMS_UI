import 'dart:html';

class FileModel {
  String? url;
  String? fileName;
  String? mime;
  int? bytes;
  FileModel({
    this.url,
    this.fileName,
    this.mime,
    this.bytes,
  });
  String get size {
    final kb = bytes ?? 0 / 1024;
    final mb = kb / 1024;
    return (mb > 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }

  File createHtmlFileFromModel(FileModel? model) {
    // Create a blob from the bytes of the file
    final blob = Blob([model?.bytes], model?.mime);

    // Create a new file with the blob and filename
    final file = File([blob], model?.fileName ?? "", {'type': model?.mime});
    return file;
    // Use the file as needed
    // ...
  }

  ///
}
