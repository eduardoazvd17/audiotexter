import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:audiotexter/src/core/models/record_model.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';

import '../../data/enums/home_views_enum.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final RecordingController recordingController;
  late final PageController pageViewController;

  HomeControllerBase({required this.recordingController}) {
    pageViewController = PageController();
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

  @computed
  bool get hasPermission => recordingController.hasPermission;

  @observable
  List<RecordModel> myRecords = [];

  @observable
  List<RecordModel> deletedRecords = [];

  @action
  Future<void> _loadRecordings() async {}

  @action
  void openRecord(RecordModel recordModel) {}

  @action
  void deleteRecord(RecordModel recordModel) {}

  @action
  void permanentDeleteRecord(RecordModel recordModel) {}

  @action
  void permanentDeleteAllRecords() {}
}
