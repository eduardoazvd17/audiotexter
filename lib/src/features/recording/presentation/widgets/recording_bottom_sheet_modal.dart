import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';

class RecordingBottomSheetModal extends StatelessWidget {
  final RecordingController controller;
  const RecordingBottomSheetModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: AnimatedSize(
        curve: Curves.ease,
        duration: const Duration(milliseconds: 250),
        child: Observer(
          builder: (_) {
            if (controller.isLoading) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(50),
                    child: Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                ],
              );
            }

            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        controller.isPaused
                            ? AppLocalizations.of(context)!.paused
                            : AppLocalizations.of(context)!.recording,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        controller.timerString,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      controller: controller.nameController,
                      textCapitalization: TextCapitalization.sentences,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        label: Text(AppLocalizations.of(context)!.name),
                        suffixIcon: const Icon(Icons.audio_file_outlined),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () async {
                            if (controller.isPaused) {
                              await controller.resumeRecording();
                            } else {
                              await controller.pauseRecording();
                            }
                          },
                          icon: Icon(
                            controller.isPaused
                                ? Icons.play_arrow
                                : Icons.pause,
                            size: 30,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.stopRecording().then((recordingModel) {
                              Navigator.of(context).pop(recordingModel);
                            });
                          },
                          icon: Icon(
                            Icons.save,
                            size: 40,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.stopRecording().then((recordingModel) {
                              if (recordingModel != null) {
                                File(recordingModel.path).delete();
                              }
                              Navigator.of(context).pop(null);
                            });
                          },
                          icon: Icon(
                            CupertinoIcons.delete,
                            size: 30,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
