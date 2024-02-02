import 'package:flutter/material.dart';

class DeletedView extends StatelessWidget {
  const DeletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text('Deleted Records'),
      ),
    );
  }
}
