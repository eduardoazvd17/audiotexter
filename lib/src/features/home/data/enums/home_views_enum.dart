import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum HomeViewsEnum {
  myRecordings,
  deletedRecordings,
}

extension HomeViewsEnumExtension on HomeViewsEnum {
  IconData get icon {
    return switch (this) {
      HomeViewsEnum.myRecordings => Icons.list,
      HomeViewsEnum.deletedRecordings => Icons.delete_forever,
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      HomeViewsEnum.myRecordings => AppLocalizations.of(context)!.myRecordings,
      HomeViewsEnum.deletedRecordings =>
        AppLocalizations.of(context)!.deletedRecordings,
    };
  }
}
