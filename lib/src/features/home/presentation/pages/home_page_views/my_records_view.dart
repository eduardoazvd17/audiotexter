import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/widgets/empty_list_widget.dart';
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
          Expanded(
            child: Observer(
              builder: (context) {
                if (controller.myRecords.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmptyListWidget(
                            icon: HomeViewsEnum.myRecords.icon,
                            message: AppLocalizations.of(context)!
                                .myRecordsEmptyMessage,
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.myRecords.length,
                  itemBuilder: (context, index) {
                    final recordModel = controller.myRecords[index];
                    return RecordTileWidget(
                      recordModel: recordModel,
                      onOpen: () => controller.openRecord(recordModel),
                      onDelete: () => controller.deleteRecord(recordModel),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
