import 'package:cmms/domain/domain.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.

// coverage:ignore-file
abstract class UserModuleTypeConstants {
  //REQ Order
  static int kReqOrderModuleTypeId = 36;
  static String kReqOrderModuleTypeName = "Req Order";
}

AppFlavor? appFlavor;
