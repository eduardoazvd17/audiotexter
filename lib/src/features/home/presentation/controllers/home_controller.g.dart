// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
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

  @override
  String toString() {
    return '''
myRecords: ${myRecords},
deletedRecords: ${deletedRecords}
    ''';
  }
}
