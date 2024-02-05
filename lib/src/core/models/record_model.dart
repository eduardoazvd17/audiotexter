import 'dart:io';

import 'package:equatable/equatable.dart';

class RecordModel extends Equatable {
  final String title;
  final DateTime date;
  final String path;

  String get formattedDate => date.toString();
  File get file => File(path);

  const RecordModel({
    required this.title,
    required this.date,
    required this.path,
  });

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
      title: map['title'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      path: map['path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'path': path,
    };
  }

  @override
  List<Object?> get props => [title, date, path];
}
