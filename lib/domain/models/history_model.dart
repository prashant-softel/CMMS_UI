class HistoryModel {
  final int? id;
  final int? moduleType;
  final int? moduleRefId;
  final String? secModule;
  final int? secRefId;
  final String? comment;
  final int? status;
  final DateTime? timestamp;
  final double? latitude;
  final double? longitude;

  HistoryModel({
    this.id,
    this.moduleType,
    this.moduleRefId,
    this.secModule,
    this.secRefId,
    this.comment,
    this.status,
    this.timestamp,
    this.latitude,
    this.longitude,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] as int?,
      moduleType: json['module_type'] as int?,
      moduleRefId: json['module_ref_id'] as int?,
      secModule: json['sec_module'] as String?,
      secRefId: json['sec_ref_id'] as int?,
      comment: json['comment'] as String?,
      status: json['status'] as int?,
      timestamp: DateTime.tryParse(json['timestamp'] as String? ?? ''),
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }
}
