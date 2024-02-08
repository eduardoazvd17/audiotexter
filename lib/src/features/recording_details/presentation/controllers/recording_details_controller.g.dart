// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordingDetailsController on RecordingDetailsControllerBase, Store {
  late final _$recordingModelAtom = Atom(
      name: 'RecordingDetailsControllerBase.recordingModel', context: context);

  @override
  RecordingModel? get recordingModel {
    _$recordingModelAtom.reportRead();
    return super.recordingModel;
  }

  @override
  set recordingModel(RecordingModel? value) {
    _$recordingModelAtom.reportWrite(value, super.recordingModel, () {
      super.recordingModel = value;
    });
  }

  late final _$audioPlayerControllerAtom = Atom(
      name: 'RecordingDetailsControllerBase.audioPlayerController',
      context: context);

  @override
  AudioPlayer? get audioPlayerController {
    _$audioPlayerControllerAtom.reportRead();
    return super.audioPlayerController;
  }

  @override
  set audioPlayerController(AudioPlayer? value) {
    _$audioPlayerControllerAtom.reportWrite(value, super.audioPlayerController,
        () {
      super.audioPlayerController = value;
    });
  }

  late final _$RecordingDetailsControllerBaseActionController =
      ActionController(
          name: 'RecordingDetailsControllerBase', context: context);

  @override
  void renameRecording(String name) {
    final _$actionInfo = _$RecordingDetailsControllerBaseActionController
        .startAction(name: 'RecordingDetailsControllerBase.renameRecording');
    try {
      return super.renameRecording(name);
    } finally {
      _$RecordingDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteRecording() {
    final _$actionInfo = _$RecordingDetailsControllerBaseActionController
        .startAction(name: 'RecordingDetailsControllerBase.deleteRecording');
    try {
      return super.deleteRecording();
    } finally {
      _$RecordingDetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recordingModel: ${recordingModel},
audioPlayerController: ${audioPlayerController}
    ''';
  }
}
