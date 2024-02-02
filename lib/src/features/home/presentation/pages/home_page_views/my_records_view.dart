import 'package:flutter/material.dart';

class MyRecordsView extends StatelessWidget {
  const MyRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text('My Records'),
      ),
    );
  }
}
