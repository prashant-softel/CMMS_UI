class StoreSignupDataModel {
  StoreSignupDataModel(
      {required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.countryCode,
      required this.email,
      required this.password,
      required this.userName});
      
  String firstName;
  String lastName;
  String userName;
  String phoneNumber;
  String countryCode;
  String email;
  String password;
}
