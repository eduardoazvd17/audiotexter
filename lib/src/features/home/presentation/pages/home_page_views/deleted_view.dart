import 'package:flutter/material.dart';

import '../../../data/enums/home_views_enum.dart';

class DeletedView extends StatelessWidget {
  const DeletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          HomeViewsEnum.deletedRecords.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
