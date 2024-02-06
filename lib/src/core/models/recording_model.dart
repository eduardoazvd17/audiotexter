// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class RecordingModel extends Equatable {
  final String title;
  final DateTime date;
  final String path;

  String get formattedDate {
    final String timeString = "${date.hour}:${date.minute}:${date.second}";
    return "${DateFormat.yMMMd().format(date)} - $timeString";
  }

  File get file => File(path);

  const RecordingModel({
    required this.title,
    required this.date,
    required this.path,
  });

  RecordingModel copyWith({
    String? title,
  }) {
    return RecordingModel(
      title: title ?? this.title,
      date: date,
      path: path,
    );
  }

  factory RecordingModel.fromMap(Map<String, dynamic> map) {
    return RecordingModel(
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
