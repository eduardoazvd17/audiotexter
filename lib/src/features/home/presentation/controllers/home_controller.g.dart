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

  late final _$myRecordsAtom =
      Atom(name: 'HomeControllerBase.myRecords', context: context);

  @override
  ObservableList<RecordModel> get myRecords {
    _$myRecordsAtom.reportRead();
    return super.myRecords;
  }

  @override
  set myRecords(ObservableList<RecordModel> value) {
    _$myRecordsAtom.reportWrite(value, super.myRecords, () {
      super.myRecords = value;
    });
  }

  late final _$deletedRecordsAtom =
      Atom(name: 'HomeControllerBase.deletedRecords', context: context);

  @override
  ObservableList<RecordModel> get deletedRecords {
    _$deletedRecordsAtom.reportRead();
    return super.deletedRecords;
  }

  @override
  set deletedRecords(ObservableList<RecordModel> value) {
    _$deletedRecordsAtom.reportWrite(value, super.deletedRecords, () {
      super.deletedRecords = value;
    });
  }

  late final _$_loadRecordingsAsyncAction =
      AsyncAction('HomeControllerBase._loadRecordings', context: context);

  @override
  Future<void> _loadRecordings() {
    return _$_loadRecordingsAsyncAction.run(() => super._loadRecordings());
  }

  late final _$openRecordAsyncAction =
      AsyncAction('HomeControllerBase.openRecord', context: context);

  @override
  Future<void> openRecord(RecordModel recordModel) {
    return _$openRecordAsyncAction.run(() => super.openRecord(recordModel));
  }

  late final _$permanentDeleteRecordAsyncAction =
      AsyncAction('HomeControllerBase.permanentDeleteRecord', context: context);

  @override
  Future<void> permanentDeleteRecord(RecordModel recordModel) {
    return _$permanentDeleteRecordAsyncAction
        .run(() => super.permanentDeleteRecord(recordModel));
  }

  late final _$permanentDeleteAllRecordsAsyncAction = AsyncAction(
      'HomeControllerBase.permanentDeleteAllRecords',
      context: context);

  @override
  Future<void> permanentDeleteAllRecords() {
    return _$permanentDeleteAllRecordsAsyncAction
        .run(() => super.permanentDeleteAllRecords());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void addRecord(String audioPath) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.addRecord');
    try {
      return super.addRecord(audioPath);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteRecord(RecordModel recordModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.deleteRecord');
    try {
      return super.deleteRecord(recordModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void restoreRecord(RecordModel recordModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.restoreRecord');
    try {
      return super.restoreRecord(recordModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
myRecords: ${myRecords},
deletedRecords: ${deletedRecords},
hasPermission: ${hasPermission}
    ''';
  }
}
