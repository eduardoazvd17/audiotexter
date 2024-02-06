import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/widgets/empty_list_widget.dart';

class RecordingDetailsPage extends StatelessWidget {
  final RecordingDetailsController controller;
  const RecordingDetailsPage({super.key, required this.controller});

  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.recordingModel =
          ModalRoute.of(context)?.settings.arguments as RecordingModel?;
    });

    if (controller.recordingModel != null) {
      return Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return Text(controller.recordingModel!.name);
          }),
          actions: [
            IconButton(
              onPressed: () async {
                final nameController = TextEditingController(
                  text: controller.recordingModel?.name,
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
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            controller.recordingModel =
                                controller.recordingModel
                                  ?..copyWith(
                                    name: nameController.text,
                                  );
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.save,
                          ),
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
            ),
          ],
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
    } else {
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
}
