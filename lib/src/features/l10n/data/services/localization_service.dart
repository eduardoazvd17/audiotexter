import 'package:audiotexter/src/features/l10n/data/enums/supported_languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  static const String kLocalization = "localization";

  Future<void> saveLocalization(LocalizationEnum language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(kLocalization, language.index);
  }

  Future<LocalizationEnum> loadLocalization() async {
    final prefs = await SharedPreferences.getInstance();
    final int? index = prefs.getInt(kLocalization);
    return index != null
        ? LocalizationEnum.values[index]
        : LocalizationEnum.autoDetect;
  }
}
