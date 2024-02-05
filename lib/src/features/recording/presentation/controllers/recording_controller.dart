import 'package:mobx/mobx.dart';
import 'package:record/record.dart';
part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  late final AudioRecorder _recorder;

  RecordingControllerBase({required AudioRecorder audioRecorder}) {
    _recorder = audioRecorder;
    _checkPermissions();
  }

  @observable
  bool hasPermission = false;
  Future<void> _checkPermissions() async {
    hasPermission = await _recorder.hasPermission();
  }

  Future<void> startRecord() async {}
  Future<void> pauseRecord() async {}
  Future<void> resumeRecord() async {}
  Future<String> stopRecord() async => "";
}
