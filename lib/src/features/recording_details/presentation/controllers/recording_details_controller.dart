import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/recording_model.dart';
part 'recording_details_controller.g.dart';

class RecordingDetailsController = RecordingDetailsControllerBase
    with _$RecordingDetailsController;

abstract class RecordingDetailsControllerBase with Store {
  void init(RecordingModel? recordingModel) {
    this.recordingModel ??= recordingModel;
  }

  @observable
  RecordingModel? recordingModel;

  @action
  void renameRecording(String name) {
    if (recordingModel != null) {
      GetIt.I.get<HomeController>().renameRecording(recordingModel!, name);
      final newRecordingModel = recordingModel!.copyWith(name: name);
      recordingModel = newRecordingModel;
    }
  }

  @action
  void deleteRecording() {
    if (recordingModel != null) {
      GetIt.I.get<HomeController>().deleteRecording(recordingModel!);
    }
  }
}
