import 'dart:convert';

class Category {
  final int id;
  final String name;
  final double amount;
  final double commition;
  final DateTime createdAt;
  final int totalCount;
  final double totalAmount;
  final double totalCommition;
  final String collectionCycle;
  final String duration;

  Category({
    required this.id,
    required this.name,
    required this.amount,
    required this.commition,
    required this.createdAt,
    required this.totalCount,
    required this.totalAmount,
    required this.totalCommition,
    required this.collectionCycle,
    required this.duration,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      amount: json['amount'].toDouble(),
      commition: json['commition'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      totalCount: json['totalCount'],
      totalAmount: json['totalAmount'].toDouble(),
      totalCommition: json['totalCommition'].toDouble(),
      collectionCycle: json['collectionCycle'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'commition': commition,
      'createdAt': createdAt.toIso8601String(),
      'totalCount': totalCount,
      'totalAmount': totalAmount,
      'totalCommition': totalCommition,
      'collectionCycle': collectionCycle,
      'duration': duration,
    };
  }
}
