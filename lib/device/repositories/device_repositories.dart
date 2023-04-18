// coverage:ignore-file
import 'package:cmms/app/app.dart';
import 'package:cmms/data/data.dart';
import 'package:cmms/device/device.dart';
import 'package:cmms/domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:synchronized/synchronized.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// initialize flutter secure storage
  final _flutterSecureStorage = const FlutterSecureStorage();
  bool isTokenStored = false;
  var _lock = new Lock();

  /// initialize the hive box
  Future<void> init({bool isTest = false}) async {
    if (isTest) {
      Hive.init('HIVE_TEST');
      await Hive.openBox<dynamic>(StringConstants.appName);
    } else {
      await Hive.initFlutter();
      await Hive.openBox<dynamic>(
        StringConstants.appName,
      );
    }
  }

  /// Returns the box in which the data is stored.
  Box _getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  void clearData(dynamic key) {
    _getBox().delete(key);
  }

  /// Delete the box
  @override
  void deleteBox() {
    Hive.box<void>(StringConstants.appName).clear();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    var box = _getBox();
    var defaultValue = '';
    if (key == DeviceConstants.localLang) {
      defaultValue = DataConstants.defaultLang;
    }
    String? value = box.get(key, defaultValue: defaultValue) as String;
    return value;
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    _getBox().put(key, value);
  }

  /// return bool value
  @override
  bool getBoolValue(String key) =>
      _getBox().get(key, defaultValue: false) as bool;

  @override
  Future<String> getSecuredValue(String key) async {
    try {
      print('reading $key');
      var value = '';
      await _lock.synchronized(() async {
        if (kIsWeb) {
          value = getStringValue(key);
        } else {
          value = await _flutterSecureStorage.read(key: key) ?? '';
        }
      });
      print("$key read, value = $value");
      return value;
    } catch (error) {
      print("Error reading token: $error");
      return '';
    }
  }

  @override
  Future<void> saveValueSecurely(String key, String value) async {
    try {
      await _lock.synchronized(() async {
        if (kIsWeb) {
          saveValue(key, value);
        } else {
          await _flutterSecureStorage.write(key: key, value: value);
        }
      });

      isTokenStored = true;
      print("Token saved");
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> saveUserAcessData(String key, String value) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      print(e);
    }
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    _flutterSecureStorage.delete(key: key);
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    _flutterSecureStorage.deleteAll();
  }

  @override
  Future<ResponseModel> getStateList(int countryCode) {
    throw UnimplementedError();
  }

  @override
  Future<void> generateToken() {
    throw UnimplementedError();
  }

  @override
  Future<String> getUserAccessData(String key) async {
    try {
      var value = await _flutterSecureStorage.read(key: key);
      if (value == null || value.isEmpty) {
        value = '';
      }
      return value;
    } catch (error) {
      return '';
    }
  }

  @override
  Future<String> getNewPermitAccessData(String key) async {
    try {
      var value = await _flutterSecureStorage.read(key: key);
      if (value == null || value.isEmpty) {
        value = '';
      }
      return value;
    } catch (error) {
      return '';
    }
  }

  @override
  Future<void> getInventoryList({
    required bool isLoading,
    required auth,
    required int facilityId,
    required String categoryIds,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getBlockList({
    required bool isLoading,
    required String facilityId,
    required String auth,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getEquipmentList(
      {required bool isLoading,
      required String facilityId,
      required String auth}) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getWorkTypeList({
    bool? isLoading,
    String? categoryIds,
    String? auth,
  }) {
    throw UnimplementedError();
  }

  ///
}
