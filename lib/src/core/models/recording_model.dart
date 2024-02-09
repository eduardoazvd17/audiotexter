// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class RecordingModel extends Equatable {
  final String name;
  final DateTime date;
  final String path;
  final String recognizedWords;
  final String? editedRecognizedWords;

  String formattedDate(Locale? locale) {
    final String hour = date.hour.toString().padLeft(2, "0");
    final String minute = date.minute.toString().padLeft(2, "0");
    final String second = date.second.toString().padLeft(2, "0");
    final String timeString = "$hour:$minute:$second";
    return "${DateFormat.yMMMd(locale).format(date)} - $timeString";
  }

  File get file => File(path);

  const RecordingModel({
    required this.name,
    required this.date,
    required this.path,
    required this.recognizedWords,
    this.editedRecognizedWords,
  });

  RecordingModel copyWith({
    String? name,
    String? editedRecognizedWords,
  }) {
    return RecordingModel(
      name: name ?? this.name,
      date: date,
      path: path,
      recognizedWords: recognizedWords,
      editedRecognizedWords:
          editedRecognizedWords ?? this.editedRecognizedWords,
    );
  }

  factory RecordingModel.fromMap(Map<String, dynamic> map) {
    return RecordingModel(
      name: map['name'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      path: map['path'],
      recognizedWords: map['recognizedWords'],
      editedRecognizedWords: map['editedRecognizedWords'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date.millisecondsSinceEpoch,
      'path': path,
      'recognizedWords': recognizedWords,
      'editedRecognizedWords': editedRecognizedWords,
    };
  }

  @override
  List<Object?> get props => [
        name,
        date,
        path,
        recognizedWords,
        editedRecognizedWords,
      ];
}
