import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  const EmptyListWidget({super.key, required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
