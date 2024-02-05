import 'dart:async';
import 'dart:io';

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
  Timer? timer;

  @observable
  int recordTime = 0;

  @action
  Future<void> startRecord() async {
    _checkPermissions();
    if (hasPermission) {
      final bool isRecording = await _recorder.isRecording();
      if (!isRecording) {
        final String audioPath =
            "$audiosDirectoryPath/${DateTime.now().millisecondsSinceEpoch}.m4a";
        _recorder.start(const RecordConfig(), path: audioPath);

        timer = Timer.periodic(const Duration(seconds: 1), (_) => recordTime++);
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

      timer?.cancel();
      timer = null;
      this.isPaused = true;
    }
  }

  @action
  Future<void> resumeRecord() async {
    final bool isRecording = await _recorder.isRecording();
    final bool isPaused = await _recorder.isPaused();
    if (isRecording && isPaused) {
      await _recorder.resume();

      timer = Timer.periodic(const Duration(seconds: 1), (_) => recordTime++);
      this.isPaused = false;
    }
  }

  @action
  Future<String?> stopRecord() async {
    final bool isRecording = await _recorder.isRecording();
    if (isRecording) {
      final String? audioPath = await _recorder.stop();

      timer?.cancel();
      timer = null;
      this.isRecording = false;
      isPaused = false;

      return audioPath;
    }
    return null;
  }
}
