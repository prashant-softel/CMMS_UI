// coverage:ignore-file
/// [ResponseModel] handels the Api [data], [errorCode] and tells 
/// api is called Successfully or it has error while calling. 
class ResponseModel {
  ResponseModel({
    required this.data,
    required this.hasError,
    this.errorCode,
   
  });
  final String data;
  final bool hasError;
  final int? errorCode;
}
