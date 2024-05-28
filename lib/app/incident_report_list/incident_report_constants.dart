import 'package:cmms/domain/domain.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.

// coverage:ignore-file
abstract class IncidentStatusConstants {
  /// PTW Status
  static int IR_CREATED_INITIAL = 181;
  static int IR_REJECTED_INITIAL = 182;
  static int IR_APPROVED_INITIAL = 183;
  static int IR_CREATED_INVESTIGATION = 184;
  static int IR_REJECTED_INVESTIGATION = 185;
  static int IR_APPROVED_INVESTIGATION = 186;
  static int IR_UPDATED = 187;
  static int IR_CANCEL = 188;
  static int IR_CLOSED = 189;
}

AppFlavor? appFlavor;
