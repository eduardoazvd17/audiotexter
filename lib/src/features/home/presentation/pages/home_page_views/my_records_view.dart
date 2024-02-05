import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../../widgets/record_tile_widget.dart';

class MyRecordsView extends StatelessWidget {
  final HomeController controller;
  const MyRecordsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              HomeViewsEnum.myRecords.title(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: controller.myRecords.length,
              itemBuilder: (context, index) {
                final recordModel = controller.myRecords[index];
                return RecordTileWidget(
                  recordModel: recordModel,
                  onOpen: () => controller.openRecord(recordModel),
                  onDelete: () => controller.deleteRecord(recordModel),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
