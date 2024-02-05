import 'package:mobx/mobx.dart';
part 'recording_controller.g.dart';

class RecordingController = RecordingControllerBase with _$RecordingController;

abstract class RecordingControllerBase with Store {
  void startRecord() {}
  void pauseRecord() {}
  void resumeRecord() {}
  String stopRecord() => "";
}
