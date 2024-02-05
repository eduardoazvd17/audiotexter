import 'package:flutter/material.dart';

import '../../../data/enums/home_views_enum.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/record_tile_widget.dart';

class DeletedRecordsView extends StatelessWidget {
  final HomeController controller;
  const DeletedRecordsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              HomeViewsEnum.deletedRecords.title(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: controller.deletedRecords.length,
              itemBuilder: (context, index) {
                final recordModel = controller.myRecords[index];
                return Opacity(
                  opacity: 0.5,
                  child: RecordTileWidget(
                    recordModel: recordModel,
                    onDelete: () {
                      controller.permanentDeleteRecord(recordModel);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
