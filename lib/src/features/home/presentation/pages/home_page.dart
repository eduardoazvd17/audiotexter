import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/deleted_view.dart';
import 'package:audiotexter/src/features/home/presentation/pages/home_page_views/my_records_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
    return PageView(
      children: const [
        MyRecordsView(),
        DeletedView(),
      ],
    );
  }

  Widget _floatingActionButtonWidget() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade100,
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
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      child: SafeArea(
        child: GNav(
          gap: 10,
          onTabChange: (int index) {},
          tabs: const [
            GButton(
              icon: Icons.list,
              text: 'My Records',
            ),
            GButton(
              icon: Icons.delete_forever,
              text: 'Deleted',
            ),
          ],
        ),
      ),
    );
  }
}
