import 'package:mobileapp/models/lots_model.dart';

class CategoryModel {
  final int id;
  final String name;
  final int amount;
  final double commition;
  final DateTime createdAt;
  final int totalCount;
  final double totalAmount;
  final double totalCommition;
  final String collectionCycle;
  final String duration;
  final List<LotsModel>? lots;

  CategoryModel({
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
    required this.lots,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      amount: int.parse((json['amount'])),
      commition: double.parse((json['commition'])),
      createdAt: DateTime.parse(json['createdAt'] as String),
      totalCount: json['totalCount'] as int,
      totalAmount: double.parse(json['totalAmount']),
      totalCommition: double.parse(json['totalCommition']),
      collectionCycle: json['collectionCycle'] as String,
      duration: json['duration'] as String,
      lots: json["lot"] != null
          ? (json["lot"] as List<dynamic>)
              .map((e) => LotsModel.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      // 'commition': commition,
      // 'createdAt': createdAt.toIso8601String(),
      // 'totalCount': totalCount,
      // 'totalAmount': totalAmount,
      // 'totalCommition': totalCommition,
      // 'collectionCycle': collectionCycle,
      // 'duration': duration,
    };
  }
}
