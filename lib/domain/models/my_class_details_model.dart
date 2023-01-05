// To parse this JSON data, do
//
//     final myClassesDetailsModel = myClassesDetailsModelFromJson(jsonString);

import 'dart:convert';
import 'package:cmms/domain/domain.dart';

MyClassesDetailsModel myClassesDetailsModelFromJson(String str) =>
    MyClassesDetailsModel.fromJson(json.decode(str) as Map<String, dynamic>);

String myClassesDetailsModelToJson(MyClassesDetailsModel data) =>
    json.encode(data.toJson());

class MyClassesDetailsModel {
  factory MyClassesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MyClassesDetailsModel(
        message: json['message'] as String? ?? '',
        data:
            MyClassesDetailsData.fromJson(json['data'] as Map<String, dynamic>),
      );

  MyClassesDetailsModel({
    this.message,
    this.data,
  });

  String? message;
  MyClassesDetailsData? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'message': message == null ? null : message,
        'data': data!.toJson(),
      };
}

class MyClassesDetailsData {
  factory MyClassesDetailsData.fromJson(Map<String, dynamic> json) =>
      MyClassesDetailsData(
        id: json['_id'] as String? ?? '',
        virtualOrderId: json['virtualOrderId'] as String? ?? '',
        bookingAmount: json['bookingAmount'] as num? ?? 0,
        extensionAmount: json['extensionAmount'] as num? ?? 0,
        earningAmount: json['earningAmount'] as num? ?? 0,
        paymentMethod: json['paymentMethod'] as String? ?? '',
        learningObjective: json['learningObjective'] == null
            ? null
            : List<LearningObjectives>.from((json['learningObjective']
                    as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    LearningObjectives.fromJson(x as Map<String, dynamic>))),
        durationInMin: json['durationInMin'] as int? ?? 0,
        notes: json['notes'] as String? ?? '',
        createdTs: json['createdTs'] as num? ?? 0,
        completedAt: json['completedAt'] as num? ?? 0,
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
        subject: json['subject'] == null
            ? null
            : SubjectOne.fromJson(json['subject'] as Map<String, dynamic>),
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        attachments: json['attachments'] == null
            ? []
            : List<String>.from((json['attachments'] as List<dynamic>)
                .map<dynamic>((dynamic x) => x)),
        ratingParameters: json['ratingParameters'] == null
            ? []
            : List<RatingsData>.from((json['ratingParameters'] as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    RatingsData.fromJson(x as Map<String, dynamic>))),
        userInvoiceUrl: json['userInvoiceUrl'] as String? ?? '',
        paymentAmountResponse: json['paymentAmount'] == null
            ? null
            : PaymentAmountResponse.fromJson(
                json['paymentAmount'] as Map<String, dynamic>),
        orderUrl: json['orderUrl'] as String? ?? '',
        parent: json['parent'] == null
            ? null
            : Parent.fromJson(json['parent'] as Map<String, dynamic>),
        student: json['student'] == null
            ? null
            : StudentsData.fromJson(json['student'] as Map<String, dynamic>),
        reviewRatingsBy: json['reviewRatingsBy'] == null
            ? null
            : ReviewRatingsBy.fromJson(
                json['reviewRatingsBy'] as Map<String, dynamic>),
        tax: json['tax'] as num? ?? 0,
        totalBookingAmount: json['totalBookingAmount'] as num? ?? 0,
        paymentBreakdownData: json['paymentBreakdownData'] == null
            ? []
            : List<PaymentBreakdownData>.from((json['paymentBreakdownData']
                    as List<dynamic>)
                .map<dynamic>((dynamic x) =>
                    PaymentBreakdownData.fromJson(x as Map<String, dynamic>))),
        cancleReason: json['cancleReason'] as String? ?? '',
      );

  MyClassesDetailsData({
    this.id,
    this.learningObjective,
    this.durationInMin,
    this.notes,
    this.createdTs,
    this.creator,
    this.subject,
    this.price,
    this.attachments,
    this.userInvoiceUrl,
    this.paymentAmountResponse,
    this.orderUrl,
    this.parent,
    this.reviewRatingsBy,
    this.student,
    this.virtualOrderId,
    this.bookingAmount,
    this.earningAmount,
    this.extensionAmount,
    this.paymentMethod,
    this.ratingParameters,
    this.completedAt,
    this.tax,
    this.totalBookingAmount,
    this.paymentBreakdownData,
    this.cancleReason,
  });

  String? id;
  List<LearningObjectives>? learningObjective;
  int? durationInMin;
  String? notes;
  num? createdTs;
  num? completedAt;
  Creator? creator;
  SubjectOne? subject;
  Price? price;
  List<String>? attachments;
  String? userInvoiceUrl;
  PaymentAmountResponse? paymentAmountResponse;
  String? orderUrl;
  String? virtualOrderId;
  Parent? parent;
  ReviewRatingsBy? reviewRatingsBy;
  StudentsData? student;
  num? bookingAmount;
  num? extensionAmount;
  num? earningAmount;
  String? paymentMethod;
  List<RatingsData>? ratingParameters;
  num? tax;
  num? totalBookingAmount;
  List<PaymentBreakdownData>? paymentBreakdownData;
  String? cancleReason;

  Map<String, dynamic> toJson() => <String, dynamic>{
        '_id': id,
        'learningObjective': List<dynamic>.from(
            learningObjective!.map<dynamic>((x) => x.toJson())),
        'durationInMin': durationInMin,
        'notes': notes,
        'createdTs': createdTs,
        'paymentMethod': paymentMethod,
        'completedAt': completedAt,
        'bookingAmount': paymentMethod,
        'extensionAmount': paymentMethod,
        'earningAmount': paymentMethod,
        'creator': creator!.toJson(),
        'subject': subject!.toJson(),
        'price': price!.toJson(),
        'attachments': List<dynamic>.from(attachments!.map<dynamic>((x) => x)),
        'userInvoiceUrl': userInvoiceUrl,
        'virtualOrderId': virtualOrderId,
        'orderUrl': orderUrl,
        'parent': '${parent?.toJson()}',
        'reviewRatingsBy': '${reviewRatingsBy?.toJson()}',
        'student': student!.toJson(),
        'ratingParameters': List<dynamic>.from(
            ratingParameters!.map<dynamic>((x) => x.toJson())),
        'tax': tax,
        'totalBookingAmount': totalBookingAmount,
        'paymentBreakdownData': List<dynamic>.from(
            paymentBreakdownData!.map<dynamic>((x) => x.toJson())),
        'cancleReason': cancleReason,
      };
}

// class Creator {
//
//   factory Creator.fromJson(Map<String, dynamic> json) => Creator(
//     id: json['_id'] as String? ?? '',
//     firstName: json['firstName'] as String? ?? '',
//     lastName: json['lastName'] as String? ?? '',
//     totalRating: json['totalRating'].todouble() as double? ?? 0,
//     avgRating: json['avgRating'].todouble() as double? ?? 0,
//   );
//   Creator({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.totalRating,
//     this.avgRating,
//   });
//
//   String? id;
//   String? firstName;
//   String? lastName;
//   double? totalRating;
//   double? avgRating;
//
//   Map<String, dynamic> toJson() => <String, dynamic>{
//     '_id': id,
//     'firstName': firstName,
//     'lastName': lastName,
//     'totalRating': totalRating,
//     'avgRating': avgRating,
//   };
// }

// class Price {
//
//   factory Price.fromJson(Map<String, dynamic> json) => Price(
//     price: json['price'] as int? ?? 0,
//     currencyCode: json['currencyCode'] as String? ?? '',
//     currencySymbol: json['currencySymbol'] as String? ?? '',
//   );
//   Price({
//     this.price,
//     this.currencyCode,
//     this.currencySymbol,
//   });
//
//   int? price;
//   String? currencyCode;
//   String? currencySymbol;
//
//   Map<String, dynamic> toJson() => <String, dynamic>{
//     'price': price,
//     'currencyCode': currencyCode,
//     'currencySymbol': currencySymbol,
//   };
// }
//
// class Subject {
//
//   factory Subject.fromJson(Map<String, dynamic> json) => Subject(
//     id: json['_id'] as String? ?? '',
//     subject: json['subject'] as String? ?? '',
//   );
//   Subject({
//     this.id,
//     this.subject,
//   });
//
//   String? id;
//   String? subject;
//
//   Map<String, dynamic> toJson() => <String, dynamic>{
//     '_id': id,
//     'subject': subject,
//   };
// }

class ReviewRatingsBy {
  factory ReviewRatingsBy.fromJson(Map<String, dynamic> json) =>
      ReviewRatingsBy(
        parent: json['PARENT'] == null
            ? null
            : Parent.fromJson(json['PARENT'] as Map<String, dynamic>),
        teacher: json['CREATOR'] == null
            ? null
            : Parent.fromJson(json['CREATOR'] as Map<String, dynamic>),
      );
  ReviewRatingsBy({
    this.parent,
    this.teacher,
  });

  Parent? parent;
  Parent? teacher;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'PARENT': '${parent?.toJson()}',
        'CREATOR': '${teacher?.toJson()}',
      };
}

class Parent {
  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        ratings: json['ratings'] == null
            ? null
            : List<Rating>.from((json['ratings'] as List<dynamic>).map<dynamic>(
                (dynamic x) => Rating.fromJson(x as Map<String, dynamic>))),
        avgRating: json['avgRating'] as num? ?? 0,
        review: json['review'] as String? ?? '',
      );
  Parent({
    this.ratings,
    this.avgRating,
    this.review,
  });

  List<Rating>? ratings;
  num? avgRating;
  String? review;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ratings': ratings != null
            ? List<dynamic>.from(ratings!.map<dynamic>((x) => x.toJson()))
            : <dynamic>[],
        'avgRating': avgRating,
        'review': review,
      };
}

class PaymentBreakdownData {
  factory PaymentBreakdownData.fromJson(Map<String, dynamic> json) =>
      PaymentBreakdownData(
        userAmount: json['userAmount'] as num? ?? 0,
        walletAmount: json['walletAmount'] as num? ?? 0,
        pgAmount: json['pgAmount'] as num? ?? 0,
        paymentMethod: json['paymentMethod'] as String? ?? '',
        min: json['min'] as num? ?? 0,
      );
  PaymentBreakdownData({
    this.userAmount,
    this.walletAmount,
    this.pgAmount,
    this.paymentMethod,
    this.min,
  });

  num? userAmount;
  num? walletAmount;
  num? pgAmount;
  num? min;
  String? paymentMethod;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userAmount': userAmount,
        'walletAmount': walletAmount,
        'pgAmount': pgAmount,
        'paymentMethod': paymentMethod,
        'min': min,
      };
}

// class Rating {
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//     parameterId: json['parameterId'] as String? ?? '',
//     title: json['title'] as String? ?? '',
//     rating: json['rating'].toDouble() as double,
//   );
//   Rating({
//     this.parameterId,
//     this.title,
//     this.rating,
//   });
//
//   String? parameterId;
//   String? title;
//   double? rating;
//
//   Map<String, dynamic> toJson() => <String, dynamic>{
//     'parameterId': parameterId,
//     'title': title,
//     'rating': rating,
//   };
// }
