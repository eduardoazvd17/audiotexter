import 'package:mobx/mobx.dart';

import '../../../../core/models/recording_model.dart';
part 'recording_details_controller.g.dart';

class RecordingDetailsController = RecordingDetailsControllerBase
    with _$RecordingDetailsController;

abstract class RecordingDetailsControllerBase with Store {
  @observable
  RecordingModel? recordingModel;
}
