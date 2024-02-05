import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/widgets/empty_list_widget.dart';
import '../../../../l10n/l10n.dart';
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
          Expanded(
            child: Observer(builder: (context) {
              if (controller.deletedRecords.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmptyListWidget(
                          icon: HomeViewsEnum.deletedRecords.icon,
                          message: AppLocalizations.of(context)!
                              .deletedRecordsEmptyMessage,
                        ),
                      ],
                    ),
                  ],
                );
              }

              return ListView.builder(
                itemCount: controller.deletedRecords.length,
                itemBuilder: (context, index) {
                  final recordModel = controller.deletedRecords[index];
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
              );
            }),
          ),
        ],
      ),
    );
  }
}
