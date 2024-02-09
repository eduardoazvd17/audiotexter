import 'package:audiotexter/src/features/l10n/data/enums/supported_languages.dart';
import 'package:audiotexter/src/features/l10n/data/services/localization_service.dart';
import 'package:mobx/mobx.dart';
part 'localization_controller.g.dart';

class LocalizationController = LocalizationControllerBase
    with _$LocalizationController;

abstract class LocalizationControllerBase with Store {
  late final LocalizationService _service;
  LocalizationControllerBase({required LocalizationService service}) {
    _service = service;
    init();
  }

  Future<void> init() async {
    selectedLanguage = await _service.loadLocalization();
  }

  @observable
  LocalizationEnum selectedLanguage = LocalizationEnum.autoDetect;
}
