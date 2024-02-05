import 'package:audiotexter/src/core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../data/enums/home_views_enum.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final pageViewController = PageController();

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

  void openRecord(RecordModel recordModel) {}
  void deleteRecord(RecordModel recordModel) {}
  void permanentDeleteRecord(RecordModel recordModel) {}
}
