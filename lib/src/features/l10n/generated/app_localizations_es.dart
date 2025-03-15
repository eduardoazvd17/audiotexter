// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'AudioTexter';

  @override
  String get myRecordings => 'Mis grabaciones';

  @override
  String get deletedRecordings => 'Grabaciones eliminadas';

  @override
  String get myRecordingsEmptyMessage => 'No se encontraron grabaciones';

  @override
  String get deletedRecordingsEmptyMessage => 'No hay grabaciones eliminadas';

  @override
  String get recording => 'Grabación';

  @override
  String get paused => 'En pausa';

  @override
  String get stopAndSaveRecording => 'Detener y guardar grabación';

  @override
  String get cancelRecording => 'Cancelar grabación';

  @override
  String get newRecording => 'Nueva grabación';

  @override
  String get name => 'Nombre';

  @override
  String get noName => 'Sin nombre';

  @override
  String get deleteRecordingTitle => 'Eliminar grabación';

  @override
  String deleteRecordingContent(String title) {
    return '¿Realmente deseas eliminar la grabación: $title?\n\nPuedes restaurarla más tarde desde la pestaña \"Grabaciones eliminadas\".';
  }

  @override
  String permanentDeleteRecordingContent(String title) {
    return '¿Realmente deseas eliminar permanentemente la grabación: $title?';
  }

  @override
  String get deleteAllRecordingsTitle => 'Eliminar todas las grabaciones';

  @override
  String get deleteAllRecordingsContent => '¿Realmente deseas eliminar permanentemente todas las grabaciones?';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';

  @override
  String get recordingDetailsNullErrorMessage => 'Debes seleccionar una grabación para ver esta página de detalles';

  @override
  String get renameRecording => 'Renombrar grabación';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get editRecognizedWords => 'Editar palabras reconocidas';

  @override
  String get showOriginalText => 'Mostrar texto original';

  @override
  String get showEditedText => 'Mostrar texto editado';

  @override
  String get autoDetect => 'Detección automática';

  @override
  String get english => 'Inglés';

  @override
  String get portuguese => 'Portugués';

  @override
  String get spanish => 'Español';
}
