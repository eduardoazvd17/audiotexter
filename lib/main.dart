import 'package:audiotexter/src/core/utils/localization_utils.dart';
import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:audiotexter/src/features/recording/presentation/controllers/recording_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'src/core/utils/theme_utils.dart';
import 'src/features/home/presentation/pages/home_page.dart';
import 'src/features/l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerLazySingleton(() => HomeController());
  GetIt.I.registerSingleton(RecordingController());
  runApp(const AudioTexterApp());
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
