// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'AudioTexter';

  @override
  String get myRecordings => 'My Recordings';

  @override
  String get deletedRecordings => 'Deleted Recordings';

  @override
  String get myRecordingsEmptyMessage => 'No recordings found';

  @override
  String get deletedRecordingsEmptyMessage => 'No deleted recordings';

  @override
  String get recording => 'Recording';

  @override
  String get paused => 'Paused';

  @override
  String get stopAndSaveRecording => 'Stop and save recording';

  @override
  String get cancelRecording => 'Cancel recording';

  @override
  String get newRecording => 'New recording';

  @override
  String get name => 'Name';

  @override
  String get noName => 'No name';

  @override
  String get deleteRecordingTitle => 'Delete recording';

  @override
  String deleteRecordingContent(String title) {
    return 'Do you really want to delete the recording: $title?\n\nYou can restore it later from \"Deleted Recordings\" tab.';
  }

  @override
  String permanentDeleteRecordingContent(String title) {
    return 'Do you really want to permanent delete the recording: $title?';
  }

  @override
  String get deleteAllRecordingsTitle => 'Delete all recordings';

  @override
  String get deleteAllRecordingsContent => 'Do you really want to permanent delete all recordings?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get recordingDetailsNullErrorMessage => 'You must select a recording to view this details page';

  @override
  String get renameRecording => 'Rename recording';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get editRecognizedWords => 'Edit recognized words';

  @override
  String get showOriginalText => 'Show original text';

  @override
  String get showEditedText => 'Show edited text';

  @override
  String get autoDetect => 'Auto detect';

  @override
  String get english => 'English';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get spanish => 'Spanish';
}
