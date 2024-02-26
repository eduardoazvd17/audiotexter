import 'dart:convert';
import 'dart:io';

import 'package:audiotexter/src/features/l10n/l10n.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SpeechToTextService {
  late final LocalizationController _localizationController;
  late final Map<String, dynamic>? _credentials;
  SpeechToTextService({
    required LocalizationController localizationController,
  }) {
    _localizationController = localizationController;
    _loadCredentials();
  }

  Future<String> transcribe(String audioPath) async {
    try {
      final String model = _getLocaleParam(
        _localizationController.selectedLocalization,
      );
      final Uri url =
          Uri.parse(_credentials!["endpoint"] + '/v1/recognize?model=$model');
      final String auth = base64Encode(
        utf8.encode('apikey:${_credentials["apikey"]}'),
      );

      final http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Basic $auth',
          'Content-Type': 'audio/wav',
        },
        body: await File(audioPath).readAsBytes(),
      );

      return response.body;
    } catch (_) {
      return "Error: $_";
    }
  }

  String _getLocaleParam(LocalizationEnum localization) {
    const supported = [
      "nl-NL_Multimedia",
      "en-AU_Multimedia",
      "en-GB_Multimedia",
      "en-US_Multimedia",
      "fr-CA_Multimedia",
      "fr-FR_Multimedia",
      "de-DE_Multimedia",
      "it-IT_Multimedia",
      "ja-JP_Multimedia",
      "ko-KR_Multimedia",
      "pt-BR_Multimedia",
      "es-ES_Multimedia",
    ];

    final String systemLocale =
        '${Intl.systemLocale.replaceAll('_', '-')}_Multimedia';

    return switch (localization) {
      LocalizationEnum.autoDetect =>
        supported.contains(systemLocale) ? systemLocale : "en-US_Multimedia",
      LocalizationEnum.english => "en-US_Multimedia",
      LocalizationEnum.portuguese => "pt-BR_Multimedia",
      LocalizationEnum.spanish => "es-ES_Multimedia",
    };
  }

  Future<void> _loadCredentials() async {
    try {
      final String credentials =
          await rootBundle.loadString('assets/credentials.json');
      _credentials = Map<String, dynamic>.from(jsonDecode(credentials));
    } catch (_) {
      _credentials = null;
    }
  }
}
