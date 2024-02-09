import 'package:flutter/cupertino.dart';
import '../../features/l10n/l10n.dart';

enum SupportedLanguages {
  autoDetect,
  english,
  portuguese,
  spanish,
}

extension SupportedLanguagesExtension on SupportedLanguages {
  Widget get icon {
    return switch (this) {
      SupportedLanguages.autoDetect => const Icon(CupertinoIcons.settings),
      SupportedLanguages.english => Image.asset(
          'assets/icons/languages/en.png',
          width: 24,
        ),
      SupportedLanguages.portuguese => Image.asset(
          'assets/icons/languages/pt.png',
          width: 24,
        ),
      SupportedLanguages.spanish => Image.asset(
          'assets/icons/languages/es.png',
          width: 24,
        ),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      SupportedLanguages.autoDetect => AppLocalizations.of(context)!.autoDetect,
      SupportedLanguages.english => AppLocalizations.of(context)!.english,
      SupportedLanguages.portuguese => AppLocalizations.of(context)!.portuguese,
      SupportedLanguages.spanish => AppLocalizations.of(context)!.spanish,
    };
  }

  Locale? get locale {
    return switch (this) {
      SupportedLanguages.autoDetect => null,
      SupportedLanguages.english => const Locale('en'),
      SupportedLanguages.portuguese => const Locale('pt'),
      SupportedLanguages.spanish => const Locale('es'),
    };
  }
}
