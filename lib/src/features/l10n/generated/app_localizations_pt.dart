// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'AudioTexter';

  @override
  String get myRecordings => 'Minhas Gravações';

  @override
  String get deletedRecordings => 'Gravações Excluídas';

  @override
  String get myRecordingsEmptyMessage => 'Nenhuma gravação encontrada';

  @override
  String get deletedRecordingsEmptyMessage => 'Nenhuma gravação excluída';

  @override
  String get recording => 'Gravação';

  @override
  String get paused => 'Pausado';

  @override
  String get stopAndSaveRecording => 'Parar e salvar gravação';

  @override
  String get cancelRecording => 'Cancelar gravação';

  @override
  String get newRecording => 'Nova gravação';

  @override
  String get name => 'Nome';

  @override
  String get noName => 'Sem nome';

  @override
  String get deleteRecordingTitle => 'Excluir gravação';

  @override
  String deleteRecordingContent(String title) {
    return 'Você realmente deseja excluir a gravação: $title?\n\nVocê pode restaurá-la depois na aba \"Gravações Excluídas\".';
  }

  @override
  String permanentDeleteRecordingContent(String title) {
    return 'Você realmente deseja excluir permanentemente a gravação: $title?';
  }

  @override
  String get deleteAllRecordingsTitle => 'Excluir todas as gravações';

  @override
  String get deleteAllRecordingsContent => 'Você realmente deseja excluir permanentemente todas as gravações?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get recordingDetailsNullErrorMessage => 'Você deve selecionar uma gravação para visualizar esta página de detalhes';

  @override
  String get renameRecording => 'Renomear gravação';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get editRecognizedWords => 'Editar palavras reconhecidas';

  @override
  String get showOriginalText => 'Mostrar texto original';

  @override
  String get showEditedText => 'Mostrar texto editado';

  @override
  String get autoDetect => 'Detecção automática';

  @override
  String get english => 'Inglês';

  @override
  String get portuguese => 'Português';

  @override
  String get spanish => 'Espanhol';
}
