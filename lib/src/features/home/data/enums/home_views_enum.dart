import 'package:flutter/material.dart';

enum HomeViewsEnum {
  myRecords,
  deletedRecords,
}

extension HomeViewsEnumExtension on HomeViewsEnum {
  IconData get icon => switch (this) {
        HomeViewsEnum.myRecords => Icons.list,
        HomeViewsEnum.deletedRecords => Icons.delete_forever,
      };

  String get title => switch (this) {
        HomeViewsEnum.myRecords => "My Records",
        HomeViewsEnum.deletedRecords => "Deleted Records",
      };
}
