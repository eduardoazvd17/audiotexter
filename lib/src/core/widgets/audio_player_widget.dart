import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerWidget extends StatelessWidget {
  final AudioPlayer? controller;
  AudioPlayerWidget({super.key, required this.controller}) {
    controller?.positionStream.listen(
      (position) {
        if (controller?.duration != null) {
          if (position.inMilliseconds >= controller!.duration!.inMilliseconds) {
            controller!.pause();
            controller!.seek(Duration.zero);
          }
        }
      },
    );
  }

  String duraitonInMMSS(Duration? duration) {
    final durationInSeconds = duration?.inSeconds ?? 0;
    final int minutes = durationInSeconds ~/ 60;
    final int seconds = durationInSeconds % 60;
    return "${NumberFormat("00").format(minutes)}:${NumberFormat("00").format(seconds)}";
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) {
      return const Padding(
        padding: EdgeInsets.all(50),
        child: Center(child: CupertinoActivityIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(25),
      child: StreamBuilder<Duration?>(
        stream: controller?.durationStream,
        builder: (context, snapshotDuration) {
          final Duration? duration = snapshotDuration.data;
          final double durationInMS =
              duration?.inMilliseconds.toDouble() ?? 0.0;
          return StreamBuilder<Duration?>(
            stream: controller?.positionStream,
            builder: (context, snapshotPosition) {
              final Duration? position = snapshotPosition.data;
              final double positionInMS =
                  position?.inMilliseconds.toDouble() ?? 0.0;

              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: StreamBuilder<bool>(
                          stream: controller?.playingStream,
                          builder: (context, snapshot) {
                            final bool isPlaying = snapshot.data ?? false;
                            return IconButton(
                              onPressed: () async {
                                if (isPlaying) {
                                  await controller?.pause();
                                } else {
                                  await controller?.play();
                                }
                              },
                              icon: isPlaying
                                  ? const Icon(CupertinoIcons.pause)
                                  : const Icon(CupertinoIcons.play),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Slider(
                              value: positionInMS,
                              max: durationInMS,
                              onChanged: (positionInMS) async {
                                await controller?.pause();
                                await controller?.seek(
                                  Duration(milliseconds: positionInMS.toInt()),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(duraitonInMMSS(position)),
                                Text(duraitonInMMSS(duration)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
