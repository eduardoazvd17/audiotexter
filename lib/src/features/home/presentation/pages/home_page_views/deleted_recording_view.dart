import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/widgets/empty_list_widget.dart';
import '../../../../l10n/l10n.dart';
import '../../../data/enums/home_views_enum.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/recording_tile_widget.dart';

class DeletedRecordingsView extends StatelessWidget {
  final HomeController controller;
  const DeletedRecordingsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              HomeViewsEnum.deletedRecordings.title(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Observer(builder: (context) {
              if (controller.isLoading) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(),
                      ],
                    ),
                  ],
                );
              }

              if (controller.deletedRecordings.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmptyListWidget(
                          icon: HomeViewsEnum.deletedRecordings.icon,
                          message: AppLocalizations.of(context)!
                              .deletedRecordingsEmptyMessage,
                        ),
                      ],
                    ),
                  ],
                );
              }

              return ListView.builder(
                itemCount: controller.deletedRecordings.length,
                itemBuilder: (context, index) {
                  final recordingModel = controller.deletedRecordings[index];
                  return RecordingTileWidget(
                    recordingModel: recordingModel,
                    onDelete: () => _showDeleteRecordingDialog(
                      context,
                      recordingModel,
                    ),
                    onRestore: () {
                      controller.restoreRecording(recordingModel);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  void _showDeleteRecordingDialog(
    BuildContext context,
    RecordingModel recordingModel,
  ) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title: Text(
            AppLocalizations.of(context)!.deleteRecordingTitle,
          ),
          content: Text(
            AppLocalizations.of(context)!
                .deleteRecordingContent(recordingModel.title),
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.permanentDeleteRecording(recordingModel);
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context)!.yes,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text(
                AppLocalizations.of(context)!.no,
              ),
            ),
          ],
        );
      },
    );
  }
}