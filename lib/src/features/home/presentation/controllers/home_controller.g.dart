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

  late final _$errorAtom =
      Atom(name: 'HomeControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
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
  List<RecordModel> get myRecords {
    _$myRecordsAtom.reportRead();
    return super.myRecords;
  }

  @override
  set myRecords(List<RecordModel> value) {
    _$myRecordsAtom.reportWrite(value, super.myRecords, () {
      super.myRecords = value;
    });
  }

  late final _$deletedRecordsAtom =
      Atom(name: 'HomeControllerBase.deletedRecords', context: context);

  @override
  List<RecordModel> get deletedRecords {
    _$deletedRecordsAtom.reportRead();
    return super.deletedRecords;
  }

  @override
  set deletedRecords(List<RecordModel> value) {
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

  late final _$recordAsyncAction =
      AsyncAction('HomeControllerBase.record', context: context);

  @override
  Future<void> record(BuildContext context) {
    return _$recordAsyncAction.run(() => super.record(context));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void openRecord(RecordModel recordModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.openRecord');
    try {
      return super.openRecord(recordModel);
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
  void permanentDeleteRecord(RecordModel recordModel) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.permanentDeleteRecord');
    try {
      return super.permanentDeleteRecord(recordModel);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void permanentDeleteAllRecords(BuildContext context) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.permanentDeleteAllRecords');
    try {
      return super.permanentDeleteAllRecords(context);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
myRecords: ${myRecords},
deletedRecords: ${deletedRecords},
hasPermission: ${hasPermission}
    ''';
  }
}
