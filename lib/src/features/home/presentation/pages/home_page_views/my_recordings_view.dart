import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/pages/recording_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/widgets/empty_list_widget.dart';
import '../../widgets/recording_tile_widget.dart';

class MyRecordingsView extends StatelessWidget {
  final HomeController controller;
  const MyRecordingsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              HomeViewsEnum.myRecordings.title(context),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
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

                if (controller.myRecordings.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          EmptyListWidget(
                            icon: HomeViewsEnum.myRecordings.icon,
                            message: AppLocalizations.of(context)!
                                .myRecordingsEmptyMessage,
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: controller.myRecordings.length,
                  itemBuilder: (context, index) {
                    final recordingModel = controller.myRecordings[index];
                    return RecordingTileWidget(
                      recordingModel: recordingModel,
                      onOpen: () {
                        Navigator.of(context).pushNamed(
                          RecordingDetailsPage.routeName,
                          arguments: recordingModel,
                        );
                      },
                      onDelete: () =>
                          controller.deleteRecording(recordingModel),
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
