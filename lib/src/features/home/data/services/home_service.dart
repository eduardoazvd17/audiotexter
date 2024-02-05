import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/record_model.dart';

class HomeService {
  static const kMyRecords = "myRecords";
  static const kDeletedRecords = "deletedRecords";

  Future<void> saveMyRecords(List<RecordModel> myRecords) async {
    final List<String> jsonList = myRecords.map((e) {
      return jsonEncode(e.toMap());
    }).toList();

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kMyRecords, jsonList);
  }

  Future<void> saveDeletedRecords(List<RecordModel> deletedRecords) async {
    final List<String> jsonList = deletedRecords.map((e) {
      return jsonEncode(e.toMap());
    }).toList();

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kDeletedRecords, jsonList);
  }

  Future<List<RecordModel>> loadMyRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kMyRecords);
    final List<RecordModel> result = jsonList?.map((e) {
          return RecordModel.fromMap(Map<String, dynamic>.from(jsonDecode(e)));
        }).toList() ??
        [];
    return result;
  }

  Future<List<RecordModel>> loadDeletedRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDeletedRecords);
    final List<RecordModel> result = jsonList?.map((e) {
          return RecordModel.fromMap(Map<String, dynamic>.from(jsonDecode(e)));
        }).toList() ??
        [];
    return result;
  }
}
