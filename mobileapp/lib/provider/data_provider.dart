import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mobileapp/models/category_model.dart';
import 'package:mobileapp/models/lots_model.dart';
import 'package:mobileapp/models/user_model.dart';
import 'package:mobileapp/services/api/category_service.dart';
import 'package:mobileapp/services/api/lot_service.dart';
import 'package:mobileapp/services/api/user_service.dart';

class DataProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];
  List<LotsModel> _lots = [];
  List<User> _users = [];
  List<User> _winners = [];

  //getter
  List<LotsModel> get lots => _lots;
  List<CategoryModel> get categories => _categories;
  List<User> get users => _users;

  //setter
  void setAllCategories(List<CategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  void setAllLots(List<LotsModel> lots) {
    _lots = lots;
    notifyListeners();
  }

  void addCategory(CategoryModel category) {
    _categories.add(category);
    notifyListeners();
  }

  void addLots(LotsModel lot) {
    _lots.add(lot);
    notifyListeners();
  }

  //----------------- Starting app ------------------//
  //fetch data
  void fetchCategory() async {
    final Map<String, dynamic> data = await CategoryService().getAllCategory();
    if (data['data'] != null && data['data'] is List) {
      (data['data'] as List<dynamic>).map((e) {
        _categories.add(CategoryModel.fromJson(e as Map<String, dynamic>));
      }).toList();

      notifyListeners();
    }
  }

  void fetchLots() async {
    final Map<String, dynamic> data = await LotService().getAllLot();
    if (data['data'] != null && data['data'] is List) {
      (data['data'] as List<dynamic>).map((e) {
        _lots.add(LotsModel.fromJson(e as Map<String, dynamic>));
        // _categories.add(CategoryModel.fromJson(e as Map<String, dynamic>));
      }).toList();

      notifyListeners();
    }
  }

  void fetchUsers() async {
    final Map<String, dynamic> data = await UserService().getAllUsers();
    if (data['data'] != null && data['data'] is List) {
      (data['data'] as List<dynamic>).map((e) {
        _users.add(User.fromJson(e as Map<String, dynamic>));
        // _categories.add(CategoryModel.fromJson(e as Map<String, dynamic>));
      }).toList();

      notifyListeners();
    }
  }

  void fetcWinner() async {
    final Map<String, dynamic> data = await UserService().getAllWinners();
    if (data['data'] != null && data['data'] is List) {
      (data['data'] as List<dynamic>).map((e) {
        _winners.add(User.fromJson(e as Map<String, dynamic>));
      }).toList();

      notifyListeners();
    }
  }
}
