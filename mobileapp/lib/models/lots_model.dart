import 'dart:convert';

import 'package:mobileapp/models/category_model.dart';

class LotsModel {
  final int id;
  final ProfileModel profile;
  final int? categoryId;
  final CategoryModel category;
  final int registeredBy;
  final bool isCompleted;
  final DateTime createdAt;
  final int remainingDay;
  final double remainingAmount;
  final double cumulativePayment;

  LotsModel({
    required this.id,
    required this.profile,
    this.categoryId,
    required this.category,
    required this.registeredBy,
    required this.isCompleted,
    required this.createdAt,
    required this.remainingDay,
    required this.remainingAmount,
    required this.cumulativePayment,
  });

  factory LotsModel.fromJson(Map<String, dynamic> json) {
    return LotsModel(
      id: json['id'],
      profile: ProfileModel.fromJson(json["profile"]),
      categoryId: json['categoryId'],
      category: CategoryModel.fromJson(json["category"]),
      registeredBy: json['registeredBy'],
      isCompleted: json['isCompleted'],
      createdAt: DateTime.parse(json['createdAt']),
      remainingDay: json['remainingDay'],
      remainingAmount: double.parse(json['remainingAmount']),
      cumulativePayment: double.parse(json['cumulativePayment']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'registeredBy': registeredBy,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'remainingDay': remainingDay,
      'remainingAmount': remainingAmount,
      'cumulativePayment': cumulativePayment,
    };
  }
}

class ProfileModel {
  int id;
  int lotId;
  int userId;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String city;
  String street;
  DateTime createdAt;

  ProfileModel({
    required this.id,
    required this.lotId,
    required this.userId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.city,
    required this.street,
    required this.createdAt,
  });

  // Factory constructor to create a ProfileModel from JSON
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      gender: json['gender'],
      city: json['city'],
      street: json['street'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Method to convert a ProfileModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender,
      'city': city,
      'street': street,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
