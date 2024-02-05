import 'dart:io';

class RecordModel {
  final String title;
  final DateTime date;
  final String path;

  String get formattedDate => date.toString();
  File get file => File(path);

  RecordModel({
    required this.title,
    required this.date,
    required this.path,
  });
}
