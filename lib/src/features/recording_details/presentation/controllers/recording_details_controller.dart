import 'package:mobx/mobx.dart';

import '../../../../core/models/recording_model.dart';
part 'recording_details_controller.g.dart';

class RecordingDetailsController = RecordingDetailsControllerBase
    with _$RecordingDetailsController;

abstract class RecordingDetailsControllerBase with Store {
  void init(RecordingModel? recordingModel) {
    if (this.recordingModel?.path != recordingModel?.path) {
      this.recordingModel = recordingModel;
    }
  }

  @observable
  RecordingModel? recordingModel;

  @action
  void renameRecording(String name) {
    final newRecordingModel = recordingModel?.copyWith(name: name);
    if (newRecordingModel != null) {
      recordingModel = newRecordingModel;
    }
  }
}
