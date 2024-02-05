import 'dart:async';
import 'dart:io';

import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  late final TextEditingController titleController;
  late final String audiosDirectoryPath;
  late final AudioRecorder _recordinger;

  RecordingControllerBase({required AudioRecorder audioRecordinger}) {
    titleController = TextEditingController();
    _recordinger = audioRecordinger;
    _checkPermissions();
    _loadAudiosDirectoryPath();
  }

  @observable
  bool hasPermission = false;

  @action
  Future<void> _checkPermissions() async {
    hasPermission = await _recordinger.hasPermission();
  }

  @action
  Future<void> _loadAudiosDirectoryPath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    audiosDirectoryPath = directory.path;
  }

  @observable
  bool isRecording = false;

  @observable
  bool isPaused = false;

  @observable
  Timer? _timer;

  @observable
  int _durationInSeconds = 0;

  @computed
  Duration get duration => Duration(seconds: _durationInSeconds);

  @computed
  String get timerString {
    final int minutes = _durationInSeconds ~/ 60;
    final int seconds = _durationInSeconds % 60;
    return "${NumberFormat("00").format(minutes)}:${NumberFormat("00").format(seconds)}";
  }

  @action
  Future<void> startRecording({String? title}) async {
    _checkPermissions();
    if (hasPermission) {
      final bool isRecording = await _recordinger.isRecording();
      if (!isRecording) {
        final String audioPath =
            "$audiosDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.m4a";

        titleController.text = title ?? "New recording";
        _recordinger.start(const RecordConfig(), path: audioPath);

        _durationInSeconds = 0;
        _timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) => _durationInSeconds++,
        );
        this.isRecording = true;
        isPaused = false;
      }
    }
  }

  @action
  Future<void> pauseRecording() async {
    final bool isRecording = await _recordinger.isRecording();
    final bool isPaused = await _recordinger.isPaused();
    if (isRecording && !isPaused) {
      await _recordinger.pause();

      _timer?.cancel();
      _timer = null;
      this.isPaused = true;
    }
  }

  @action
  Future<void> resumeRecording() async {
    final bool isRecording = await _recordinger.isRecording();
    final bool isPaused = await _recordinger.isPaused();
    if (isRecording && isPaused) {
      await _recordinger.resume();

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _durationInSeconds++,
      );
      this.isPaused = false;
    }
  }

  @action
  Future<RecordingModel?> stopRecording() async {
    final bool isRecording = await _recordinger.isRecording();
    if (isRecording) {
      RecordingModel? recordingModel;
      final String? audioPath = await _recordinger.stop();
      if (audioPath != null && audioPath.isNotEmpty) {
        recordingModel = RecordingModel(
          title: titleController.text,
          date: DateTime.now().subtract(duration),
          path: audioPath,
        );
      }

      _timer?.cancel();
      _timer = null;
      this.isRecording = false;
      isPaused = false;
      titleController.text = "";
      _durationInSeconds = 0;

      return recordingModel;
    }
    return null;
  }
}
