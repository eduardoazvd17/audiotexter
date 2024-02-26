import 'dart:async';
import 'dart:io';

import 'package:audiotexter/src/features/recording/data/speech_to_text_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:audiotexter/src/core/models/recording_model.dart';

part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  late final TextEditingController nameController;
  late final AudioRecorder _recorder;
  late final SpeechToTextService _speechToTextService;
  late final String audiosDirectoryPath;

  RecordingControllerBase({
    required AudioRecorder audioRecordinger,
    required SpeechToTextService speechToTextService,
  }) {
    nameController = TextEditingController();
    _recorder = audioRecordinger;
    _speechToTextService = speechToTextService;
    _checkPermissions();
    _loadAudiosDirectoryPath();
  }

  @observable
  bool isLoading = false;

  @observable
  bool hasPermission = false;

  @action
  Future<void> _checkPermissions() async {
    hasPermission = await _recorder.hasPermission();
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
  Future<void> startRecording({
    String? title,
  }) async {
    await _checkPermissions();
    if (hasPermission) {
      isLoading = true;
      final bool isRecording = await _recorder.isRecording();
      if (!isRecording) {
        nameController.text = title ?? "New recording";
        _durationInSeconds = 0;

        final String audioPath =
            "$audiosDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.m4a";
        await _recorder.start(const RecordConfig(), path: audioPath);

        _timer = Timer.periodic(
          const Duration(seconds: 1),
          (_) => _durationInSeconds++,
        );

        this.isRecording = true;
        isPaused = false;
        isLoading = false;
      }
    }
  }

  @action
  Future<void> pauseRecording() async {
    final bool isRecording = await _recorder.isRecording();
    final bool isPaused = await _recorder.isPaused();
    if (isRecording && !isPaused) {
      isLoading = true;
      await _recorder.pause();

      _timer?.cancel();
      _timer = null;

      this.isPaused = true;
      isLoading = false;
    }
  }

  @action
  Future<void> resumeRecording() async {
    final bool isRecording = await _recorder.isRecording();
    final bool isPaused = await _recorder.isPaused();
    if (isRecording && isPaused) {
      isLoading = true;
      await _recorder.resume();

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _durationInSeconds++,
      );

      this.isPaused = false;
      isLoading = false;
    }
  }

  @action
  Future<RecordingModel?> stopRecording() async {
    final bool isRecording = await _recorder.isRecording();
    if (isRecording) {
      isLoading = true;

      final String? audioPath = await _recorder.stop();

      RecordingModel? recordingModel;
      if (audioPath != null && audioPath.isNotEmpty) {
        final String transcribeResult =
            await _speechToTextService.transcribe(audioPath);
        recordingModel = RecordingModel(
          name: nameController.text,
          date: DateTime.now().subtract(duration),
          path: audioPath,
          recognizedWords: transcribeResult,
        );
      }

      _timer?.cancel();
      _timer = null;
      _durationInSeconds = 0;

      nameController.text = "";
      this.isRecording = false;
      isPaused = false;
      isLoading = false;
      return recordingModel;
    }
    return null;
  }
}
