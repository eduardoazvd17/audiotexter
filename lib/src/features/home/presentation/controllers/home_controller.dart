import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'package:audiotexter/src/core/models/record_model.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';

import '../../data/enums/home_views_enum.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  late final PageController pageViewController;
  late final RecordingController _recordingController;
  HomeControllerBase() {
    pageViewController = PageController();
    _recordingController = GetIt.I.get<RecordingController>();
    _loadRecordings();
  }

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  HomeViewsEnum _currentPage = HomeViewsEnum.values.first;
  HomeViewsEnum get currentPage => _currentPage;
  void changePage(int index) {
    _currentPage = HomeViewsEnum.values[index];
    pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @observable
  List<RecordModel> myRecords = [];

  @observable
  List<RecordModel> deletedRecords = [];

  Future<void> _loadRecordings() async {}
  Future<void> record(BuildContext context) async {
    _recordingController;
  }

  void openRecord(RecordModel recordModel) {}
  void deleteRecord(RecordModel recordModel) {}
  void permanentDeleteRecord(RecordModel recordModel) {}
  void permanentDeleteAllRecords(BuildContext context) {}
}
