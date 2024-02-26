// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordingController on RecordingControllerBase, Store {
  Computed<Duration>? _$durationComputed;

  @override
  Duration get duration =>
      (_$durationComputed ??= Computed<Duration>(() => super.duration,
              name: 'RecordingControllerBase.duration'))
          .value;
  Computed<String>? _$timerStringComputed;

  @override
  String get timerString =>
      (_$timerStringComputed ??= Computed<String>(() => super.timerString,
              name: 'RecordingControllerBase.timerString'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'RecordingControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  late final _$_timerAtom =
      Atom(name: 'RecordingControllerBase._timer', context: context);

  @override
  Timer? get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer? value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  late final _$_durationInSecondsAtom = Atom(
      name: 'RecordingControllerBase._durationInSeconds', context: context);

  @override
  int get _durationInSeconds {
    _$_durationInSecondsAtom.reportRead();
    return super._durationInSeconds;
  }

  @override
  set _durationInSeconds(int value) {
    _$_durationInSecondsAtom.reportWrite(value, super._durationInSeconds, () {
      super._durationInSeconds = value;
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

  late final _$startRecordingAsyncAction =
      AsyncAction('RecordingControllerBase.startRecording', context: context);

  @override
  Future<void> startRecording({String? title}) {
    return _$startRecordingAsyncAction
        .run(() => super.startRecording(title: title));
  }

  late final _$pauseRecordingAsyncAction =
      AsyncAction('RecordingControllerBase.pauseRecording', context: context);

  @override
  Future<void> pauseRecording() {
    return _$pauseRecordingAsyncAction.run(() => super.pauseRecording());
  }

  late final _$resumeRecordingAsyncAction =
      AsyncAction('RecordingControllerBase.resumeRecording', context: context);

  @override
  Future<void> resumeRecording() {
    return _$resumeRecordingAsyncAction.run(() => super.resumeRecording());
  }

  late final _$stopRecordingAsyncAction =
      AsyncAction('RecordingControllerBase.stopRecording', context: context);

  @override
  Future<RecordingModel?> stopRecording() {
    return _$stopRecordingAsyncAction.run(() => super.stopRecording());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasPermission: ${hasPermission},
isRecording: ${isRecording},
isPaused: ${isPaused},
duration: ${duration},
timerString: ${timerString}
    ''';
  }
}
