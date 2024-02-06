import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';

import '../../data/enums/home_views_enum.dart';
import '../../data/services/home_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final RecordingController recordingController;
  late final PageController pageViewController;
  late final HomeService _service;

  HomeControllerBase({
    required this.recordingController,
    required HomeService service,
  }) {
    _service = service;
    pageViewController = PageController();
    _loadRecordings();
  }

  @observable
  bool isLoading = false;

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
  ObservableList<RecordingModel> myRecordings =
      ObservableList<RecordingModel>();

  @observable
  ObservableList<RecordingModel> deletedRecordings =
      ObservableList<RecordingModel>();

  @action
  Future<void> _loadRecordings() async {
    isLoading = true;
    try {
      myRecordings.addAll(await _service.loadMyRecordings());
      myRecordings.sort((a, b) => b.date.compareTo(a.date));
      deletedRecordings.addAll(await _service.loadDeletedRecordings());
    } catch (_) {}
    isLoading = false;
  }

  @action
  void updateRecording(RecordingModel before, RecordingModel? after) {
    if (after == null) {
      deleteRecording(before);
    } else {
      final int index = myRecordings.indexOf(before);
      myRecordings[index] = after;
      _service.saveMyRecordings(myRecordings);
    }
  }

  @action
  void addRecording(RecordingModel recordingModel) {
    myRecordings.add(recordingModel);
    myRecordings.sort((a, b) => b.date.compareTo(a.date));
    _service.saveMyRecordings(myRecordings);
  }

  @action
  void renameRecording(RecordingModel recordingModel, String name) {
    final int index = myRecordings.indexOf(recordingModel);
    myRecordings[index] = recordingModel.copyWith(name: name);
    _service.saveMyRecordings(myRecordings);
  }

  @action
  void deleteRecording(RecordingModel recordingModel) {
    myRecordings.remove(recordingModel);
    deletedRecordings.add(recordingModel);

    _service.saveMyRecordings(myRecordings);
    _service.saveDeletedRecordings(deletedRecordings);
  }

  @action
  void restoreRecording(RecordingModel recordingModel) {
    deletedRecordings.remove(recordingModel);
    myRecordings.add(recordingModel);
    myRecordings.sort((a, b) => b.date.compareTo(a.date));

    _service.saveDeletedRecordings(deletedRecordings);
    _service.saveMyRecordings(myRecordings);
  }

  @action
  Future<void> permanentDeleteRecording(RecordingModel recordingModel) async {
    await File(recordingModel.path).delete();
    deletedRecordings.remove(recordingModel);
    await _service.saveDeletedRecordings(deletedRecordings);
  }

  @action
  Future<void> permanentDeleteAllRecordings() async {
    for (final RecordingModel recordingModel in deletedRecordings) {
      await File(recordingModel.path).delete();
    }
    deletedRecordings.clear();
    await _service.saveDeletedRecordings(deletedRecordings);
  }
}
