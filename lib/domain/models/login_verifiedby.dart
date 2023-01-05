class LoginVerifiredBy {
  LoginVerifiredBy({
    this.twitterVerified,
    this.googleVerified,
    this.facebookVerified,
    this.emailVerified,
    this.phoneNumberVerified,
    this.appleVerified,
  });

  factory LoginVerifiredBy.fromJson(Map<String, dynamic> json) =>
      LoginVerifiredBy(
        twitterVerified: json['twitterVerified'] as bool? ?? false,
        googleVerified: json['googleVerified'] as bool? ?? false,
        facebookVerified: json['facebookVerified'] as bool? ?? false,
        emailVerified: json['emailVerified'] as bool? ?? false,
        phoneNumberVerified: json['phoneNumberVerified'] as bool? ?? false,
        appleVerified: json['appleVerified'] as bool? ?? false,
      );

  bool? twitterVerified;
  bool? googleVerified;
  bool? facebookVerified;
  bool? emailVerified;
  bool? phoneNumberVerified;
  bool? appleVerified;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'twitterVerified': twitterVerified,
        'googleVerified': googleVerified,
        'facebookVerified': facebookVerified,
        'emailVerified': emailVerified,
        'phoneNumberVerified': phoneNumberVerified,
        'appleVerified': appleVerified,
      };
}
