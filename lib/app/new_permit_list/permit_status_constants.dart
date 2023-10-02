import 'package:cmms/domain/domain.dart';

/// An asset constant class which will hold all the
/// assets path which are used in the application.
/// Will be ignored for test since all are static values and would not change.

// coverage:ignore-file
abstract class PermitStatusConstants {
  /// PTW Status
 static int PTW_CREATED = 121; ///121
 static int PTW_REJECTED_BY_ISSUER = 122; ///122
 static int PTW_ISSUED = 123; //123
 static int PTW_REJECTED_BY_APPROVER = 124; //124
 static int PTW_APPROVE = 125; //125
 static int PTW_CLOSED = 126; ///126
 static int PTW_CANCELLED_BY_ISSUER = 127; ///127
 static int PTW_CANCELLED_BY_HSE = 128; ///128
 static int PTW_CANCELLED_BY_APPROVER = 129; ///129
 static int PTW_CANCEL_REQUESTED = 130; ///130
 static int PTW_CANCEL_REQUEST_REJECTED = 131; ///131
 static int PTW_CANCEL_REQUEST_APPROVED = 132; ///132
 static int PTW_EXTEND_REQUESTED = 133; ////133
 static int PTW_EXTEND_REQUEST_REJECTED = 134; ///134
 static int PTW_EXTEND_REQUEST_APPROVE = 135; ///135
 static int PTW_LINKED_TO_JOB = 136; ///136
 static int PTW_LINKED_TO_PM = 137; ////137
 static int PTW_LINKED_TO_AUDIT = 138; ///138
 static int PTW_LINKED_TO_HOTO = 139; ///139
 static int PTW_EXPIRED = 140; ///140
 static int PTW_UPDATED = 141; ///141

  

 
}

AppFlavor? appFlavor;
