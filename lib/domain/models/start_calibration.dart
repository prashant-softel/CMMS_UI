class StartCalibrationModel {
  int assetId;
  int vendorId;
  String nextCalibrationDate;

  StartCalibrationModel({
    required this.assetId,
    required this.vendorId,
    required this.nextCalibrationDate,
  });

  factory StartCalibrationModel.fromJson(Map<String, dynamic> json) =>
      StartCalibrationModel(
        assetId: json["asset_id"],
        vendorId: json["vendor_id"],
        nextCalibrationDate: json["next_calibration_date"],
      );

  Map<String, dynamic> toJson() => {
        "asset_id": assetId,
        "vendor_id": vendorId,
        "next_calibration_date": nextCalibrationDate,
      };
}
