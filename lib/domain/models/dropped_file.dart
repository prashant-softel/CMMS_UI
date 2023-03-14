class DroppedFile {
  String? url;
  String? fileName;
  String? mime;
  int? bytes;
  DroppedFile({
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

  ///
}
