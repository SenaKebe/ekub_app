import 'dart:convert';

enum Role { ADMIN, USER }

enum Gender { MALE, FEMALE }

enum Status { ACTIVE, DEACTIVATED, PENDING }

class User {
  final int id;
  final String email;
  final String password;
  final Role role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String firstName;
  final String middleName;
  final String lastName;
  final Status activeStatus;

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.activeStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      role:
          Role.values.firstWhere((e) => e.toString() == 'Role.${json['role']}'),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      activeStatus: Status.values
          .firstWhere((e) => e.toString() == 'Status.${json['activeStatus']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'role': role.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'activeStatus': activeStatus.toString().split('.').last,
    };
  }
}

class Profiles {
  final int id;
  final int lotId;
  final int userId;
  final String firstName;
  final String middleName;
  final String lastName;
  final Gender gender;
  final String city;
  final String street;
  final DateTime createdAt;

  Profiles({
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

  factory Profiles.fromJson(Map<String, dynamic> json) {
    return Profiles(
      id: json['id'],
      lotId: json['lotId'],
      userId: json['userId'],
      firstName: json['firstName'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      gender: Gender.values
          .firstWhere((e) => e.toString() == 'Gender.${json['gender']}'),
      city: json['city'],
      street: json['street'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lotId': lotId,
      'userId': userId,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'gender': gender.toString().split('.').last,
      'city': city,
      'street': street,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
