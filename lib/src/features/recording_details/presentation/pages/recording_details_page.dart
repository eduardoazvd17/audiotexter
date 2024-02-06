import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/widgets/empty_list_widget.dart';

class RecordingDetailsPage extends StatefulWidget {
  final RecordingDetailsController controller;
  const RecordingDetailsPage({super.key, required this.controller});

  static const String routeName = "/details";

  @override
  State<RecordingDetailsPage> createState() => _RecordingDetailsPageState();
}

class _RecordingDetailsPageState extends State<RecordingDetailsPage> {
  RecordingDetailsController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.recordingModel =
          ModalRoute.of(context)?.settings.arguments as RecordingModel?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controller.recordingModel != null) {
          return _detailsContent(context);
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: EmptyListWidget(
                icon: Icons.info_outline,
                message: AppLocalizations.of(context)!
                    .recordingDetailsNullErrorMessage,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _detailsContent(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.recordingModel!.name),
        actions: [_renameRecordingButton(context)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
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
          ],
        ),
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
}
