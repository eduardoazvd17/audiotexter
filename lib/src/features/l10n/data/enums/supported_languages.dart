import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../../l10n.dart';

enum LocalizationEnum {
  autoDetect,
  english,
  portuguese,
  spanish,
}

extension SupportedLanguagesExtension on LocalizationEnum {
  Widget get icon {
    return switch (this) {
      LocalizationEnum.autoDetect => const Icon(CupertinoIcons.globe),
      LocalizationEnum.english => Image.asset(
          'assets/icons/en.png',
          width: 24,
        ),
      LocalizationEnum.portuguese => Image.asset(
          'assets/icons/pt.png',
          width: 24,
        ),
      LocalizationEnum.spanish => Image.asset(
          'assets/icons/es.png',
          width: 24,
        ),
    };
  }

  String title(BuildContext context) {
    return switch (this) {
      LocalizationEnum.autoDetect => AppLocalizations.of(context)!.autoDetect,
      LocalizationEnum.english => AppLocalizations.of(context)!.english,
      LocalizationEnum.portuguese => AppLocalizations.of(context)!.portuguese,
      LocalizationEnum.spanish => AppLocalizations.of(context)!.spanish,
    };
  }

  Locale? get locale {
    return switch (this) {
      LocalizationEnum.autoDetect => null,
      LocalizationEnum.english => const Locale('en'),
      LocalizationEnum.portuguese => const Locale('pt'),
      LocalizationEnum.spanish => const Locale('es'),
    };
  }

  String get localeId {
    return switch (this) {
      LocalizationEnum.autoDetect => Intl.systemLocale,
      LocalizationEnum.english => "en_US",
      LocalizationEnum.portuguese => "pt_BR",
      LocalizationEnum.spanish => "es_ES",
    };
  }
}
