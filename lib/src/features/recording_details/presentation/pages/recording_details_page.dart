import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/empty_list_widget.dart';

class RecordingDetailsPage extends StatelessWidget {
  final RecordingDetailsController controller;
  const RecordingDetailsPage({super.key, required this.controller});

  static const String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final RecordingModel? recordingModel =
        ModalRoute.of(context)?.settings.arguments as RecordingModel?;

    if (recordingModel == null) {
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

    return Scaffold(
      appBar: AppBar(
        title: Text(recordingModel.title),
      ),
    );
  }
}
