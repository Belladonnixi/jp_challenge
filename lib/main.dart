import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jp_challenge/core/styles/theme.dart';
import 'package:jp_challenge/features/home/screens/home_screen.dart';
import 'package:jp_challenge/features/start/screens/start_screen.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  FlutterNativeSplash.remove();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miao Miao',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      initialRoute: '/start',
      routes: {
        '/start': (context) => const StartScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
