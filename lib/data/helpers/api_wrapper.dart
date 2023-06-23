// coverage:ignore-file

import 'dart:async';
import 'dart:convert';

import 'package:cmms/app/app.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

/// API WRAPPER to call all the APIs and handle the error status codes
class ApiWrapper {
  final String _baseUrl = //(appFlavor == AppFlavor.PROD)
      //? 'https://api.cmms.in/v1/'
      //:
      'http://3.111.196.218/CMMS_API/api/';

  /// Method to make all the requests inside the app like GET, POST, PUT, Delete
  Future<ResponseModel> makeRequest(
    String url,
    Request request,
    dynamic data,
    bool isLoading,
    Map<String, String> headers,
  ) async {
    /// To see whether the network is available or not
    if ((!GetPlatform.isWeb) ? await Utility.isNetworkAvailable() : true) {
      switch (request) {
        /// Method to make the Get type request
        case Request.get:
          {
            var uri = _baseUrl + url;

            if (isLoading) Utility.showLoader();

            try {
              final response = await http
                  .get(
                    //Uri.https(_baseUrl, url),
                    Uri.parse(uri),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.post:

          /// Method to make the Post type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .post(
                    Uri.parse(uri),
                    body: json.encode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } catch (e) {
              print({"error1": e});
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.put:

          /// Method to make the Put type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: data,
                    // json.encode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }

        case Request.patch:

          /// Method to make the Patch type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .patch(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}',
                  hasError: true,
                  errorCode: 1000);
            }
          }
        case Request.delete:

          /// Method to make the Delete type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();

              final response = await http
                  .delete(
                    Uri.parse(uri),
                    body: jsonEncode(data),
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              Utility.printLog(response.body);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.postMultiparts:

          /// Method to make the Delete type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();

              final request =
                  await http.MultipartRequest('POST', Uri.parse(uri));
              request.fields.addAll(data);

              http.Response response =
                  await http.Response.fromStream(await request.send());

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              Utility.printLog(response.body);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.getMultiparts:

          /// Method to make the Delete type request
          {
            var uri = _baseUrl + url;

            try {
              if (isLoading) Utility.showLoader();

              final request = await http.Request('GET', Uri.parse(uri));

              request.headers.addAll(headers);

              http.Response response =
                  await http.Response.fromStream(await request.send());

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              Utility.printLog(response.body);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
        case Request.awsUpload:

          /// Method to make the Put type request
          {
            var uri = url;

            try {
              if (isLoading) Utility.showLoader();
              final response = await http
                  .put(
                    Uri.parse(uri),
                    body: data,
                    headers: headers,
                  )
                  .timeout(const Duration(seconds: 120));

              if (isLoading) Utility.closeDialog();

              Utility.printILog(uri);
              return returnResponse(response);
            } on TimeoutException catch (_) {
              if (isLoading) Utility.closeDialog();
              return ResponseModel(
                  data: '{"message":"Request timed out"}', hasError: true);
            }
          }
      }
    }

    /// If there is no network available then instead of print can show the no internet widget too
    else {
      if (Get.isDialogOpen!) {
        Get.back<void>();
      }
      return ResponseModel(
        data:
            '{"message":"No internet, please enable mobile data or wi-fi in your phone settings and try again"}',
        hasError: true,
        errorCode: 1000,
      );
    }
  }

  /// Method to return the API response based upon the status code of the server
  ResponseModel returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 203:
      case 205:
      case 208:
        return ResponseModel(
            data: response.body,
            hasError: false,
            errorCode: response.statusCode);
      case 400:
      case 401:

        /// unauthorized
        if (response.statusCode == 401) {
          Repository(DeviceRepository(), DataRepository(ConnectHelper()))
              .clearData(StringConstants.appName);
          Repository(DeviceRepository(), DataRepository(ConnectHelper()))
              .clearData(LocalKeys.isAppExists);
          Repository(DeviceRepository(), DataRepository(ConnectHelper()))
              .deleteAllSecuredValues();
          RouteManagement.goOffAllLogin();
        }
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 406:

        /// To hit refresh token
        return ResponseModel(
          data: response.body,
          hasError: true,
          errorCode: response.statusCode,
        );
      case 409:
      case 500:
      case 522:
      case 204:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
      default:
        return ResponseModel(
            data: response.body,
            hasError: true,
            errorCode: response.statusCode);
    }
  }
}
