import 'package:audiotexter/src/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'src/core/utils/theme_utils.dart';
import 'src/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const AudioTexterApp());
}

class AudioTexterApp extends StatelessWidget {
  const AudioTexterApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudioTexter',
      debugShowCheckedModeBanner: false,
      theme: ThemeUtils.lightTheme,
      darkTheme: ThemeUtils.darkTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => HomePage(controller: HomeController()),
      },
    );
  }
}
