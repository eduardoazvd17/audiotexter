import 'package:audiotexter/src/core/widgets/audio_player_widget.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/models/recording_model.dart';
import '../../../../core/utils/theme_utils.dart';
import '../../../../core/widgets/empty_list_widget.dart';

class RecordingDetailsPage extends StatelessWidget {
  final RecordingDetailsController controller;
  late final TextEditingController _recognizedWordsController;

  RecordingDetailsPage({
    super.key,
    required RecordingModel? recordingModel,
    required this.controller,
  }) {
    _recognizedWordsController = TextEditingController();
    controller.init(recordingModel);
  }

  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
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
        centerTitle: true,
        title: controller.recordingModel!.name.isEmpty
            ? Opacity(
                opacity: 0.25,
                child: Text(AppLocalizations.of(context)!.noName),
              )
            : Text(controller.recordingModel!.name),
        actions: [
          _renameRecordingButton(context),
          _deleteRecordingButton(context),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getRecordingDetailsAndActions(context),
          const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Divider(height: 0),
          ),
          Expanded(child: _getRecognizedWordsWidget(context)),
        ],
      ),
      bottomNavigationBar: _getAudioPlayerWidget(context),
    );
  }

  Widget _getRecordingDetailsAndActions(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            controller.recordingModel!.formattedDate(
              GetIt.I
                  .get<LocalizationController>()
                  .selectedLocalization
                  .localeId,
            ),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 8),
          child: Center(
            child: ToggleButtons(
              isSelected: [
                !controller.showOriginal,
                controller.showOriginal,
              ],
              onPressed: controller.isEditing
                  ? null
                  : (index) {
                      if (index == 0) {
                        controller.showOriginal = false;
                      }
                      if (index == 1) {
                        controller.showOriginal = true;
                      }
                    },
              borderRadius: BorderRadius.circular(10),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(AppLocalizations.of(context)!.showEditedText),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(AppLocalizations.of(context)!.showOriginalText),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (controller.isEditing) ...[
              TextButton.icon(
                onPressed: () {
                  final String editedRecognizedWords =
                      _recognizedWordsController.text;
                  controller.editRecordingRecognizedWords(
                    editedRecognizedWords,
                  );
                  controller.isEditing = false;
                },
                icon: const Icon(Icons.save),
                label: Text(AppLocalizations.of(context)!.save),
              ),
              TextButton.icon(
                onPressed: () {
                  controller.isEditing = false;
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
            ] else
              TextButton.icon(
                onPressed: () {
                  _recognizedWordsController.text =
                      controller.recordingModel!.editedRecognizedWords ??
                          controller.recordingModel!.recognizedWords;
                  controller.isEditing = true;
                },
                icon: Icon(
                  Icons.text_fields_sharp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                label: Text(
                  AppLocalizations.of(context)!.editRecognizedWords,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _getRecognizedWordsWidget(BuildContext context) {
    if (controller.isEditing) {
      return Padding(
        padding: const EdgeInsets.all(12.5),
        child: TextFormField(
          expands: true,
          maxLines: null,
          autofocus: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          controller: _recognizedWordsController,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.newline,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      );
    } else {
      final scrollController = ScrollController();
      return Scrollbar(
        thumbVisibility: true,
        controller: scrollController,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: SelectableText(
              controller.showOriginal
                  ? controller.recordingModel!.recognizedWords
                  : (controller.recordingModel!.editedRecognizedWords ??
                      controller.recordingModel!.recognizedWords),
            ),
          ),
        ),
      );
    }
  }

  Widget _getAudioPlayerWidget(BuildContext context) {
    return Material(
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 0,
            color: ThemeUtils.borderColor,
          ),
          Observer(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: AudioPlayerWidget(
                  controller: controller.audioPlayerController,
                ),
              );
            },
          ),
        ],
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
