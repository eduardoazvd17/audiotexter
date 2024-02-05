import 'dart:io';

import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RecordingBottomSheetModal extends StatelessWidget {
  final RecordingController controller;
  const RecordingBottomSheetModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.isRecording
                      ? [
                          IconButton(
                            onPressed: () async {
                              if (controller.isPaused) {
                                await controller.resumeRecord();
                              } else {
                                await controller.pauseRecord();
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
                              controller.stopRecord().then((audioPath) {
                                Navigator.of(context).pop(audioPath);
                              });
                            },
                            icon: Icon(
                              Icons.save,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.stopRecord().then((audioPath) {
                                if (audioPath != null) File(audioPath).delete();
                                Navigator.of(context).pop(null);
                              });
                            },
                            icon: Icon(
                              CupertinoIcons.delete,
                              size: 30,
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ]
                      : [
                          IconButton(
                            onPressed: () async {
                              await controller.startRecord();
                            },
                            icon: Icon(
                              Icons.mic,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop(null);
                            },
                            icon: Icon(
                              Icons.close,
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
    );
  }
}
