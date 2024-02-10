import 'package:audiotexter/src/core/models/recording_model.dart';
import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/utils/theme_utils.dart';
import '../../../l10n/presentation/widgets/change_localization_button.dart';
import '../../../recording/presentation/widgets/recording_bottom_sheet_modal.dart';
import 'home_page_views/deleted_recording_view.dart';
import 'home_page_views/my_recordings_view.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  static const String routeName = "/";

  Future<void> _onTapFloatingActionButton(BuildContext context) async {
    switch (controller.currentPage) {
      case HomeViewsEnum.myRecordings:
        if (controller.hasPermission) {
          controller.recordingController.startRecording(
            title:
                "${AppLocalizations.of(context)!.newRecording} ${controller.myRecordings.length + 1}",
          );
          HapticFeedback.mediumImpact();
          final recordingModel = await showModalBottomSheet<RecordingModel?>(
            context: context,
            enableDrag: false,
            isDismissible: false,
            isScrollControlled: true,
            builder: (context) {
              return RecordingBottomSheetModal(
                controller: controller.recordingController,
              );
            },
          );
          if (recordingModel != null) {
            controller.addRecording(recordingModel);
          }
          HapticFeedback.mediumImpact();
        }
      case HomeViewsEnum.deletedRecordings:
        if (controller.deletedRecordings.isNotEmpty) {
          _showDeleteAllRecordingsDialog(context);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AudioTexter'),
        centerTitle: true,
        actions: [
          ChangeLocalizationButton(
            controller: GetIt.I.get<LocalizationController>(),
          ),
        ],
      ),
      body: _pageViewWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingActionButtonWidget(context),
      bottomNavigationBar: _navigationBarWidget(),
    );
  }

  Widget _pageViewWidget() {
    return Observer(builder: (context) {
      return PageView(
        controller: controller.pageViewController,
        onPageChanged: controller.changePage,
        children: [
          MyRecordingsView(controller: controller),
          DeletedRecordingsView(controller: controller),
        ],
      );
    });
  }

  Widget _floatingActionButtonWidget(BuildContext context) {
    return Observer(
      builder: (_) {
        return Material(
          elevation: 5,
          color: switch (controller.currentPage) {
            HomeViewsEnum.myRecordings =>
              controller.hasPermission ? Colors.red : Colors.grey,
            HomeViewsEnum.deletedRecordings =>
              controller.deletedRecordings.isEmpty ? Colors.grey : Colors.red,
          },
          borderRadius: BorderRadius.circular(100),
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ThemeUtils.borderColor,
              ),
            ),
            child: InkWell(
              onTap: () => _onTapFloatingActionButton(context),
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: switch (controller.currentPage) {
                  HomeViewsEnum.myRecordings => Image.asset(
                      'assets/logo/logo.png',
                      height: 35,
                      color: ThemeUtils.borderColor,
                    ).animate().fade(),
                  HomeViewsEnum.deletedRecordings => Icon(
                      Icons.delete_forever,
                      size: 35,
                      color: ThemeUtils.borderColor,
                    ).animate().fade(),
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _navigationBarWidget() {
    return Observer(
      builder: (context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: ThemeUtils.borderColor,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 35, bottom: 25),
            child: GNav(
              gap: 10,
              selectedIndex: controller.currentPage.index,
              onTabChange: controller.changePage,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              tabs: HomeViewsEnum.values.map((page) {
                return GButton(icon: page.icon, text: page.title(context));
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void _showDeleteAllRecordingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          title: Text(
            AppLocalizations.of(context)!.deleteAllRecordingsTitle,
          ),
          content: Text(
            AppLocalizations.of(context)!.deleteAllRecordingsContent,
          ),
          actions: [
            TextButton(
              onPressed: () {
                controller.permanentDeleteAllRecordings();
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
