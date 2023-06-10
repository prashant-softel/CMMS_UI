class AddUserModel {
  AddUserModel(
      {this.secondaryEmail,
      this.id,
      this.first_name,
      this.landline_number,
      this.last_name,
      this.add_access_list,
      this.gender_id,
      this.DOB,
      this.city_id,
      this.contact_no,
      this.country_id,
      this.joiningDate,
      this.blood_group_id,
      this.state_id,
      this.photo_id,
      this.role_id,
      this.zipcode,
      this.isEmployee,
      this.facilities,
      this.credentials});
  int? id;
  String? secondaryEmail;
  String? first_name;
  String? last_name;
  String? DOB;
  String? contact_no;
  String? landline_number;
  String? joiningDate;
  int? gender_id;
  int? blood_group_id;
  int? photo_id;
  int? country_id;
  int? state_id;
  int? city_id;
  int? zipcode;
  int? role_id;
  int? isEmployee;
  Credentials? credentials;
  List<AddAccessList>? add_access_list;
  List<int>? facilities;

  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
        id: json["id"],
        secondaryEmail: json["secondaryEmail"],
        first_name: json["first_name"],
        last_name: json["last_name"],
        DOB: json["DOB"],
        contact_no: json["contact_no"],
        landline_number: json["landline_number"],
        joiningDate: json["joiningDate"],
        gender_id: json["gender_id"],
        blood_group_id: json["blood_group_id"],
        photo_id: json["photo_id"],
        country_id: json["country_id"],
        state_id: json["state_id"],
        city_id: json["city_id"],
        zipcode: json["zipcode"],
        role_id: json["role_id"],
        isEmployee: json["isEmployee"],
        facilities: List<int>.from(json["facilities"].map((x) => x)),
        credentials: Credentials.fromJson(json['credentials']),
        add_access_list: List<AddAccessList>.from(
            json["access_list"].map((x) => AddAccessList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "secondaryEmail": secondaryEmail,
        "first_name": first_name,
        "last_name": last_name,
        "DOB": DOB,
        "contact_no": contact_no,
        "landline_number": landline_number,
        "joiningDate": joiningDate,
        "gender_id": gender_id,
        "blood_group_id": blood_group_id,
        "photo_id": photo_id,
        "country_id": country_id,
        "state_id": state_id,
        "city_id": city_id,
        "zipcode": zipcode,
        "role_id": role_id,
        "isEmployee": isEmployee,
        "credentials": credentials!.toJson(),
        "facilities": List<dynamic>.from(facilities!.map((x) => x)),
        "access_list":
            List<dynamic>.from(add_access_list!.map((x) => x.toJson())),
      };
}

class AddAccessList {
  AddAccessList({
    required this.feature_id,
    required this.add,
    required this.edit,
    required this.delete,
    required this.view,
    required this.issue,
    required this.approve,
    required this.selfView,
  });

  int? feature_id;
  int? add;
  int? edit;
  int? delete;
  int? view;
  int? issue;
  int? approve;
  int? selfView;

  factory AddAccessList.fromJson(Map<String, dynamic> json) => AddAccessList(
        feature_id: json["feature_id"],
        add: json["add"],
        edit: json["edit"],
        delete: json["delete"],
        view: json["view"],
        issue: json["issue"],
        approve: json["approve"],
        selfView: json["selfView"],
      );

  Map<String, dynamic> toJson() => {
        "feature_id": feature_id,
        "add": add,
        "edit": edit,
        "delete": delete,
        "view": view,
        "issue": issue,
        "approve": approve,
        "selfView": selfView,
      };
}

class Credentials {
  String? user_name;
  String? password;

  Credentials({this.user_name, this.password});

  factory Credentials.fromJson(Map<String, dynamic> json) {
    return Credentials(
        password: json['password'], user_name: json['user_name']);
  }
  Map<String, dynamic> toJson() => {
        "password": password,
        "user_name": user_name,
      };
}
