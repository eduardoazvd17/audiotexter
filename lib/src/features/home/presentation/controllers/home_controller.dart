import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
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
  ObservableList<RecordModel> myRecords = ObservableList<RecordModel>();

  @observable
  ObservableList<RecordModel> deletedRecords = ObservableList<RecordModel>();

  @action
  Future<void> _loadRecordings() async {
    // load all saved data.
  }

  @action
  void addRecord(String audioPath) {
    myRecords.add(
      RecordModel(
        title: 'New recording (${myRecords.length + 1})',
        date: DateTime.now(),
        path: audioPath,
      ),
    );
  }

  @action
  Future<void> openRecord(RecordModel recordModel) async {
    //! TEMP
    final player = AudioPlayer();
    await player.setFilePath(recordModel.path);
    await player.play();
  }

  @action
  void deleteRecord(RecordModel recordModel) {
    myRecords.remove(recordModel);
    deletedRecords.add(recordModel);
  }

  @action
  void restoreRecord(RecordModel recordModel) {
    deletedRecords.remove(recordModel);
    myRecords.add(recordModel);
  }

  @action
  Future<void> permanentDeleteRecord(RecordModel recordModel) async {
    await File(recordModel.path).delete();
    deletedRecords.remove(recordModel);
  }

  @action
  Future<void> permanentDeleteAllRecords() async {
    for (final RecordModel recordModel in deletedRecords) {
      await File(recordModel.path).delete();
    }
    deletedRecords.clear();
  }
}
