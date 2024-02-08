import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'package:audiotexter/src/core/models/recording_model.dart';

part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  late final TextEditingController nameController;
  late final AudioRecorder _recorder;
  late final SpeechToText _speechToText;
  late final String audiosDirectoryPath;

  RecordingControllerBase({required AudioRecorder audioRecordinger}) {
    nameController = TextEditingController();
    _recorder = audioRecordinger;
    _speechToText = SpeechToText();
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
    if (hasPermission) {
      hasPermission = await _speechToText.initialize();
    }
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

  @observable
  String recognizedWords = "";

  @observable
  String recognizedWordsListenerResult = "";

  @observable
  String localeId = "";

  @computed
  String get timerString {
    final int minutes = _durationInSeconds ~/ 60;
    final int seconds = _durationInSeconds % 60;
    return "${NumberFormat("00").format(minutes)}:${NumberFormat("00").format(seconds)}";
  }

  @action
  Future<void> startRecording({
    String localeId = "pt_BR",
    String? title,
  }) async {
    _checkPermissions();
    if (hasPermission) {
      this.localeId = localeId;
      isLoading = true;
      final bool isRecording = await _recorder.isRecording();
      if (!isRecording) {
        nameController.text = title ?? "New recording";
        final String audioPath =
            "$audiosDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.m4a";
        recognizedWords = "";
        recognizedWordsListenerResult = "";

        await _speechToText.listen(
          localeId: localeId,
          onResult: (result) {
            recognizedWordsListenerResult = result.recognizedWords;
          },
        );
        _recorder.start(const RecordConfig(), path: audioPath);

        _durationInSeconds = 0;
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
      recognizedWords += "$recognizedWordsListenerResult. ";
      recognizedWordsListenerResult = "";
      await _speechToText.stop();
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
      recognizedWordsListenerResult = "";
      await _recorder.resume();
      await _speechToText.listen(
        localeId: localeId,
        onResult: (result) {
          recognizedWordsListenerResult = result.recognizedWords;
        },
      );

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
      RecordingModel? recordingModel;
      recognizedWords += "$recognizedWordsListenerResult.";
      await _speechToText.stop();

      final String? audioPath = await _recorder.stop();

      if (audioPath != null && audioPath.isNotEmpty) {
        recordingModel = RecordingModel(
          name: nameController.text,
          date: DateTime.now().subtract(duration),
          path: audioPath,
          recognizedWords: recognizedWords,
        );
      }

      _timer?.cancel();
      _timer = null;
      recognizedWords = "";
      recognizedWordsListenerResult = "";
      this.isRecording = false;
      isPaused = false;
      nameController.text = "";
      _durationInSeconds = 0;
      isLoading = false;
      return recordingModel;
    }
    return null;
  }
}
