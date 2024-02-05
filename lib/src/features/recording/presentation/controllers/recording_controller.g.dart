// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordingController on RecordingControllerBase, Store {
  late final _$hasPermissionAtom =
      Atom(name: 'RecordingControllerBase.hasPermission', context: context);

  @override
  bool get hasPermission {
    _$hasPermissionAtom.reportRead();
    return super.hasPermission;
  }

  @override
  set hasPermission(bool value) {
    _$hasPermissionAtom.reportWrite(value, super.hasPermission, () {
      super.hasPermission = value;
    });
  }

  late final _$isRecordingAtom =
      Atom(name: 'RecordingControllerBase.isRecording', context: context);

  @override
  bool get isRecording {
    _$isRecordingAtom.reportRead();
    return super.isRecording;
  }

  @override
  set isRecording(bool value) {
    _$isRecordingAtom.reportWrite(value, super.isRecording, () {
      super.isRecording = value;
    });
  }

  late final _$isPausedAtom =
      Atom(name: 'RecordingControllerBase.isPaused', context: context);

  @override
  bool get isPaused {
    _$isPausedAtom.reportRead();
    return super.isPaused;
  }

  @override
  set isPaused(bool value) {
    _$isPausedAtom.reportWrite(value, super.isPaused, () {
      super.isPaused = value;
    });
  }

  late final _$timerAtom =
      Atom(name: 'RecordingControllerBase.timer', context: context);

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  late final _$recordTimeAtom =
      Atom(name: 'RecordingControllerBase.recordTime', context: context);

  @override
  int get recordTime {
    _$recordTimeAtom.reportRead();
    return super.recordTime;
  }

  @override
  set recordTime(int value) {
    _$recordTimeAtom.reportWrite(value, super.recordTime, () {
      super.recordTime = value;
    });
  }

  late final _$_checkPermissionsAsyncAction = AsyncAction(
      'RecordingControllerBase._checkPermissions',
      context: context);

  @override
  Future<void> _checkPermissions() {
    return _$_checkPermissionsAsyncAction.run(() => super._checkPermissions());
  }

  late final _$_loadAudiosDirectoryPathAsyncAction = AsyncAction(
      'RecordingControllerBase._loadAudiosDirectoryPath',
      context: context);

  @override
  Future<void> _loadAudiosDirectoryPath() {
    return _$_loadAudiosDirectoryPathAsyncAction
        .run(() => super._loadAudiosDirectoryPath());
  }

  late final _$startRecordAsyncAction =
      AsyncAction('RecordingControllerBase.startRecord', context: context);

  @override
  Future<void> startRecord() {
    return _$startRecordAsyncAction.run(() => super.startRecord());
  }

  late final _$pauseRecordAsyncAction =
      AsyncAction('RecordingControllerBase.pauseRecord', context: context);

  @override
  Future<void> pauseRecord() {
    return _$pauseRecordAsyncAction.run(() => super.pauseRecord());
  }

  late final _$resumeRecordAsyncAction =
      AsyncAction('RecordingControllerBase.resumeRecord', context: context);

  @override
  Future<void> resumeRecord() {
    return _$resumeRecordAsyncAction.run(() => super.resumeRecord());
  }

  late final _$stopRecordAsyncAction =
      AsyncAction('RecordingControllerBase.stopRecord', context: context);

  @override
  Future<String?> stopRecord() {
    return _$stopRecordAsyncAction.run(() => super.stopRecord());
  }

  @override
  String toString() {
    return '''
hasPermission: ${hasPermission},
isRecording: ${isRecording},
isPaused: ${isPaused},
timer: ${timer},
recordTime: ${recordTime}
    ''';
  }
}
