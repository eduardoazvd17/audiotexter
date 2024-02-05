import 'dart:async';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  late final String audiosDirectoryPath;
  late final AudioRecorder _recorder;

  RecordingControllerBase({required AudioRecorder audioRecorder}) {
    _recorder = audioRecorder;
    _checkPermissions();
    _loadAudiosDirectoryPath();
  }

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
  Future<void> startRecord() async {
    _checkPermissions();
    if (hasPermission) {
      final bool isRecording = await _recorder.isRecording();
      if (!isRecording) {
        final String audioPath =
            "$audiosDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.m4a";
        _recorder.start(const RecordConfig(), path: audioPath);

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
  Future<void> pauseRecord() async {
    final bool isRecording = await _recorder.isRecording();
    final bool isPaused = await _recorder.isPaused();
    if (isRecording && !isPaused) {
      await _recorder.pause();

      _timer?.cancel();
      _timer = null;
      this.isPaused = true;
    }
  }

  @action
  Future<void> resumeRecord() async {
    final bool isRecording = await _recorder.isRecording();
    final bool isPaused = await _recorder.isPaused();
    if (isRecording && isPaused) {
      await _recorder.resume();

      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _durationInSeconds++,
      );
      this.isPaused = false;
    }
  }

  @action
  Future<String?> stopRecord() async {
    final bool isRecording = await _recorder.isRecording();
    if (isRecording) {
      final String? audioPath = await _recorder.stop();

      _durationInSeconds = 0;
      _timer?.cancel();
      _timer = null;
      this.isRecording = false;
      isPaused = false;

      return audioPath;
    }
    return null;
  }
}
