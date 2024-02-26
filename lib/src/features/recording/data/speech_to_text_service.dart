import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SpeechToTextService {
  late final Map<String, dynamic>? _credentials;
  SpeechToTextService() {
    _loadCredentials();
  }

  Future<String> transcribe(
    String audioPath, {
    int rate = 44100,
  }) async {
    try {
      final Uri url = Uri.parse(_credentials!["endpoint"] + '/v1/recognize');
      final String auth = base64Encode(
        utf8.encode('apikey:${_credentials["apikey"]}'),
      );

      final http.Response response = await http.post(
        url,
        headers: {
          'Authorization': 'Basic $auth',
          'Content-Type': 'audio/l16;rate=$rate',
        },
        body: await File(audioPath).readAsBytes(),
      );

      return response.body;
    } catch (_) {
      return "Error: $_";
    }
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
