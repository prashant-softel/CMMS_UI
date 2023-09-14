// coverage:ignore-file

abstract class StringConstants {
  static String appName = 'cmms';
  static String bitlyToken = '';
  static String webLink = 'https://web.cmms.in/';

  ///String For Permit Extend
  static String extendPermitText = """The request of extension of this permit is subject to the following conditions when met effectively & this permit, 
once extended, remains valid up to a maximum time of 4hrs.""";
  static String extendCheckPermitText = """No new set of work is being initiated in this extended hours & only a portion of work\nwhich remains unfinishedis to be completed.""";
  static String extendCheck2PermitText = """WORKFORCE & WORKING CONDITION of the site will remain unaltered during the extension.""";

  //String for permit close
  static String permitCloseText = """Certified that the subject work has been completed & the following conditions have been met.""";
  static String permitCloseCheck1 = """All men & material have been withdrawn from the site.""";
  static String permitCloseCheck2 = """Housekeeping of the area is restored to normal.""";
  static String permitCloseCheck3 = """Tools, Tackles & Equipment have been kept back in their place.""";
  static String permitCloseCheck4 = """LOTO/ISOLATION removed (if any).""";

  //Cancel Work Permit
  static String cancelWorkPermit = "This work permit is being cancelled on the following condition/s.";
  static String cancelWorkPermitCheck1 = "Unauthorized staff/workman performing the Job.";
  static String cancelWorkPermitCheck2 = """Unsafe Workplace Condition (Inadequate Barriers/Guards/ Extreme Weather Conditions/ Improper
   Access-Egress/Inadequate Lighting/Ventilation /Inadequate Warning Signages).""";
  static String cancelWorkPermitCheck3 = "Unsafe Act (Work Procedure (SOP) not followed/Inadequate PPES)";
  static String cancelWorkPermitCheck4 = "Other, please specify";

}
