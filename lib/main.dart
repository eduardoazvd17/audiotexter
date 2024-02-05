import 'package:audiotexter/src/core/utils/localization_utils.dart';
import 'package:audiotexter/src/features/home/data/services/home_service.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:record/record.dart';
import 'src/core/utils/theme_utils.dart';
import 'src/features/home/presentation/pages/home_page.dart';
import 'src/features/l10n/l10n.dart';
import 'src/features/recording/presentation/controllers/recording_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _loadDependencies();
  runApp(const AudioTexterApp());
}

void _loadDependencies() {
  GetIt.I.registerSingleton(AudioRecorder());
  GetIt.I.registerSingleton(
    RecordingController(
      audioRecordinger: GetIt.I.get<AudioRecorder>(),
    ),
  );
  GetIt.I.registerSingleton(HomeService());
  GetIt.I.registerLazySingleton(
    () => HomeController(
      recordingController: GetIt.I.get<RecordingController>(),
      service: GetIt.I.get<HomeService>(),
    ),
  );
}

class AudioTexterApp extends StatelessWidget {
  const AudioTexterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppLocalizations.of(context)?.appName ?? 'AudioTexter',
      debugShowCheckedModeBanner: false,
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      localizationsDelegates: LocalizationUtils.localizationsDelegates,
      supportedLocales: LocalizationUtils.supportedLocales,
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(controller: GetIt.I.get<HomeController>()),
      },
    );
  }
}
