import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../features/l10n/l10n.dart';

class LocalizationUtils {
  static get localizationsDelegates => [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  static get supportedLocales => const [
        Locale('en'),
        Locale('es'),
        Locale('pt'),
      ];
}
