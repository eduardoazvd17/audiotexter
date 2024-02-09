import 'package:audiotexter/src/features/l10n/data/enums/supported_languages.dart';
import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/material.dart';

class ChangeLocalizationButton extends StatelessWidget {
  final LocalizationController controller;
  const ChangeLocalizationButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<LocalizationEnum>(
      icon: controller.selectedLanguage.icon,
      onSelected: (value) {
        controller.selectedLanguage = value;
      },
      itemBuilder: (_) => LocalizationEnum.values.map((e) {
        return PopupMenuItem(
          value: e,
          child: Row(
            children: [
              e.icon,
              const SizedBox(width: 15),
              Text(e.title(context)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
