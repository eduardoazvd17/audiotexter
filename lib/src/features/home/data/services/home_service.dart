import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/recording_model.dart';

class HomeService {
  static const kMyRecordings = "myRecordings";
  static const kDeletedRecordings = "deletedRecordings";

  Future<void> saveMyRecordings(List<RecordingModel> myRecordings) async {
    final List<String> jsonList = myRecordings.map((e) {
      return jsonEncode(e.toMap());
    }).toList();

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kMyRecordings, jsonList);
  }

  Future<void> saveDeletedRecordings(
      List<RecordingModel> deletedRecordings) async {
    final List<String> jsonList = deletedRecordings.map((e) {
      return jsonEncode(e.toMap());
    }).toList();

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(kDeletedRecordings, jsonList);
  }

  Future<List<RecordingModel>> loadMyRecordings() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kMyRecordings);
    final List<RecordingModel> result = jsonList?.map((e) {
          return RecordingModel.fromMap(
              Map<String, dynamic>.from(jsonDecode(e)));
        }).toList() ??
        [];

    final resultCopy = List<RecordingModel>.from(result);
    for (final recording in resultCopy) {
      final file = File(recording.path);
      final bool exists = await file.exists();
      if (!exists) result.remove(recording);
    }
    if (resultCopy.length != result.length) {
      await saveMyRecordings(result);
    }

    return result;
  }

  Future<List<RecordingModel>> loadDeletedRecordings() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(kDeletedRecordings);
    final List<RecordingModel> result = jsonList?.map((e) {
          return RecordingModel.fromMap(
              Map<String, dynamic>.from(jsonDecode(e)));
        }).toList() ??
        [];

    final resultCopy = List<RecordingModel>.from(result);
    for (final recording in resultCopy) {
      final file = File(recording.path);
      final bool exists = await file.exists();
      if (!exists) result.remove(recording);
    }
    if (resultCopy.length != result.length) {
      await saveDeletedRecordings(result);
    }

    return result;
  }
}
