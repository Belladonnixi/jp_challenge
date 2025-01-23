import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jp_challenge/core/styles/theme.dart';
import 'package:jp_challenge/features/start/screens/start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miao Miao',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: StartScreen(),
      /*   initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute, */
    );
  }
}
