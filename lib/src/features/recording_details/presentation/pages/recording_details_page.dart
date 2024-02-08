import 'package:audiotexter/src/core/widgets/audio_player_widget.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/models/recording_model.dart';
import '../../../../core/widgets/empty_list_widget.dart';

class RecordingDetailsPage extends StatelessWidget {
  final RecordingDetailsController controller;
  const RecordingDetailsPage({super.key, required this.controller});

  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    controller.init(
      ModalRoute.of(context)?.settings.arguments as RecordingModel?,
    );

    return Observer(
      builder: (context) {
        if (controller.recordingModel != null) {
          return _recordingDetailsPageContent(context);
        } else {
          return _errorMessagePageContent(context);
        }
      },
    );
  }

  Widget _recordingDetailsPageContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: controller.recordingModel!.name.isEmpty
            ? Opacity(
                opacity: 0.25,
                child: Text(AppLocalizations.of(context)!.noName),
              )
            : Text(controller.recordingModel!.name),
        actions: [
          _renameRecordingButton(context),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                controller.recordingModel!.formattedDate,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const Divider(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  controller.recordingModel!.recognizedWords,
                ),
              ),
            ),
            Observer(
              builder: (context) {
                return AudioPlayerWidget(
                  controller: controller.audioPlayerController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  IconButton _deleteRecordingButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (_) {
            return AlertDialog.adaptive(
              title: Text(
                AppLocalizations.of(context)!.deleteRecordingTitle,
              ),
              content: Text(
                AppLocalizations.of(context)!.deleteRecordingContent(
                  controller.recordingModel!.name,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    controller.deleteRecording();
                    Navigator.of(context).pop();
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
      },
      icon: Icon(
        CupertinoIcons.delete,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }

  IconButton _renameRecordingButton(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final nameController = TextEditingController(
          text: controller.recordingModel?.name ?? '',
        );

        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text(
                AppLocalizations.of(context)!.renameRecording,
              ),
              content: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    autofocus: true,
                    controller: nameController,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {
                      controller.renameRecording(nameController.text);
                      Navigator.of(context).pop();
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    controller.renameRecording(nameController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context)!.save),
                ),
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(
        CupertinoIcons.pen,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _errorMessagePageContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: EmptyListWidget(
          icon: Icons.info_outline,
          message:
              AppLocalizations.of(context)!.recordingDetailsNullErrorMessage,
        ),
      ),
    );
  }
}
