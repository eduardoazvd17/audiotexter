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

  @action
  Future<void> _checkPermissions() async {
    hasPermission = await _recorder.hasPermission();
  }

  @action
  Future<void> startRecord() async {}
  @action
  Future<void> pauseRecord() async {}
  @action
  Future<void> resumeRecord() async {}
  @action
  Future<String> stopRecord() async => "";
}
