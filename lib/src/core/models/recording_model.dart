// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class RecordingModel extends Equatable {
  final String name;
  final DateTime date;
  final String path;

  String get formattedDate {
    final String hour = date.hour.toString().padLeft(2, "0");
    final String minute = date.minute.toString().padLeft(2, "0");
    final String second = date.second.toString().padLeft(2, "0");
    final String timeString = "$hour:$minute:$second";
    return "${DateFormat.yMMMd().format(date)} - $timeString";
  }

  File get file => File(path);

  const RecordingModel({
    required this.name,
    required this.date,
    required this.path,
  });

  RecordingModel copyWith({
    String? name,
  }) {
    return RecordingModel(
      name: name ?? this.name,
      date: date,
      path: path,
    );
  }

  factory RecordingModel.fromMap(Map<String, dynamic> map) {
    return RecordingModel(
      name: map['name'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      path: map['path'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date.millisecondsSinceEpoch,
      'path': path,
    };
  }

  @override
  List<Object?> get props => [name, date, path];
}