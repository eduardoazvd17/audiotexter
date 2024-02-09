// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  Computed<bool>? _$hasPermissionComputed;

  @override
  bool get hasPermission =>
      (_$hasPermissionComputed ??= Computed<bool>(() => super.hasPermission,
              name: 'HomeControllerBase.hasPermission'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

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

  late final _$_currentPageAtom =
      Atom(name: 'HomeControllerBase._currentPage', context: context);

  @override
  HomeViewsEnum get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(HomeViewsEnum value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  late final _$myRecordingsAtom =
      Atom(name: 'HomeControllerBase.myRecordings', context: context);

  @override
  ObservableList<RecordingModel> get myRecordings {
    _$myRecordingsAtom.reportRead();
    return super.myRecordings;
  }

  @override
  set myRecordings(ObservableList<RecordingModel> value) {
    _$myRecordingsAtom.reportWrite(value, super.myRecordings, () {
      super.myRecordings = value;
    });
  }

  late final _$deletedRecordingsAtom =
      Atom(name: 'HomeControllerBase.deletedRecordings', context: context);

  @override
  ObservableList<RecordingModel> get deletedRecordings {
    _$deletedRecordingsAtom.reportRead();
    return super.deletedRecordings;
  }

  @override
  set deletedRecordings(ObservableList<RecordingModel> value) {
    _$deletedRecordingsAtom.reportWrite(value, super.deletedRecordings, () {
      super.deletedRecordings = value;
    });
  }

  late final _$_loadRecordingsAsyncAction =
      AsyncAction('HomeControllerBase._loadRecordings', context: context);

  @override
  Future<void> _loadRecordings() {
    return _$_loadRecordingsAsyncAction.run(() => super._loadRecordings());
  }

  late final _$permanentDeleteRecordingAsyncAction = AsyncAction(
      'HomeControllerBase.permanentDeleteRecording',
      context: context);

  @override
  Future<void> permanentDeleteRecording(RecordingModel recordingModel) {
    return _$permanentDeleteRecordingAsyncAction
        .run(() => super.permanentDeleteRecording(recordingModel));
  }

  late final _$permanentDeleteAllRecordingsAsyncAction = AsyncAction(
      'HomeControllerBase.permanentDeleteAllRecordings',
      context: context);

  @override
  Future<void> permanentDeleteAllRecordings() {
    return _$permanentDeleteAllRecordingsAsyncAction
        .run(() => super.permanentDeleteAllRecordings());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void updateRecording(RecordingModel before, RecordingModel? after) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.updateRecording');
    try {
      return super.updateRecording(before, after);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addRecording(RecordingModel recordingModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.addRecording');
    try {
      return super.addRecording(recordingModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void renameRecording(RecordingModel recordingModel, String name) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.renameRecording');
    try {
      return super.renameRecording(recordingModel, name);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editRecordingRecognizedWords(
      RecordingModel recordingModel, String editedRecognizedWords) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.editRecordingRecognizedWords');
    try {
      return super
          .editRecordingRecognizedWords(recordingModel, editedRecognizedWords);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteRecording(RecordingModel recordingModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.deleteRecording');
    try {
      return super.deleteRecording(recordingModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restoreRecording(RecordingModel recordingModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.restoreRecording');
    try {
      return super.restoreRecording(recordingModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
myRecordings: ${myRecordings},
deletedRecordings: ${deletedRecordings},
hasPermission: ${hasPermission}
    ''';
  }
}
