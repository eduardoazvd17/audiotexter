import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/deleted_records_view.dart';
import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/my_records_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../core/utils/theme_utils.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AudioTexter'), centerTitle: true),
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
          MyRecordsView(controller: controller),
          DeletedRecordsView(controller: controller),
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
            HomeViewsEnum.myRecords =>
              controller.hasPermission ? Colors.red : Colors.grey,
            HomeViewsEnum.deletedRecords =>
              controller.deletedRecords.isEmpty ? Colors.grey : Colors.red,
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
              onTap: () {
                switch (controller.currentPage) {
                  case HomeViewsEnum.myRecords:
                    controller.record(context);
                  case HomeViewsEnum.deletedRecords:
                    controller.permanentDeleteAllRecords(context);
                }
              },
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: switch (controller.currentPage) {
                  HomeViewsEnum.myRecords => Icon(
                      Icons.mic,
                      size: 30,
                      color: ThemeUtils.borderColor,
                    ).animate().fade(),
                  HomeViewsEnum.deletedRecords => Icon(
                      Icons.delete_forever,
                      size: 30,
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
            padding: const EdgeInsets.only(top: 20, bottom: 12),
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
}
