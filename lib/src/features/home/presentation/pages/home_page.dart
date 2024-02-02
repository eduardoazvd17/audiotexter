import 'package:audiotexter/src/features/home/data/enums/home_views_enum.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/deleted_view.dart';
import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/my_records_view.dart';
import 'package:flutter/material.dart';
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
      floatingActionButton: _floatingActionButtonWidget(),
      bottomNavigationBar: _navigationBarWidget(),
    );
  }

  Widget _pageViewWidget() {
    return Observer(builder: (context) {
      return PageView(
        controller: controller.pageViewController,
        onPageChanged: controller.changePage,
        children: const [
          MyRecordsView(),
          DeletedView(),
        ],
      );
    });
  }

  Widget _floatingActionButtonWidget() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ThemeUtils.borderColor,
          ),
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(100),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.mic, size: 30),
          ),
        ),
      ),
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
                return GButton(icon: page.icon, text: page.title);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
