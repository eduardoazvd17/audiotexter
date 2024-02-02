import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/material.dart';

enum HomeViewsEnum {
  myRecords,
  deletedRecords,
}

extension HomeViewsEnumExtension on HomeViewsEnum {
  IconData get icon {
    return switch (this) {
      HomeViewsEnum.myRecords => Icons.list,
      HomeViewsEnum.deletedRecords => Icons.delete_forever,
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      HomeViewsEnum.myRecords => AppLocalizations.of(context)!.myRecords,
      HomeViewsEnum.deletedRecords =>
        AppLocalizations.of(context)!.deletedRecords,
    };
  }
}
