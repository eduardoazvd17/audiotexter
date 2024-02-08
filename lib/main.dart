import 'package:audiotexter/src/core/utils/localization_utils.dart';
import 'package:audiotexter/src/features/home/data/services/home_service.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/recording_details/presentation/controllers/recording_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:record/record.dart';
import 'src/core/utils/theme_utils.dart';
import 'src/features/home/presentation/pages/home_page.dart';
import 'src/features/l10n/l10n.dart';
import 'src/features/recording/presentation/controllers/recording_controller.dart';
import 'src/features/recording_details/presentation/pages/recording_details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  _loadDependencies();
  runApp(const AudioTexterApp());
}

void _loadDependencies() {
  GetIt.I.registerSingleton(
    RecordingController(
      audioRecordinger: AudioRecorder(),
    ),
  );
  GetIt.I.registerFactory(() => HomeService());
  GetIt.I.registerLazySingleton(
    () => HomeController(
      recordingController: GetIt.I.get<RecordingController>(),
      service: GetIt.I.get<HomeService>(),
    ),
  );
  GetIt.I.registerFactory(() => RecordingDetailsController());
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
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) {
          return HomePage(
            controller: GetIt.I.get<HomeController>(),
          );
        },
        RecordingDetailsPage.routeName: (_) {
          return RecordingDetailsPage(
            controller: GetIt.I.get<RecordingDetailsController>(),
          );
        },
      },
    );
  }
}
