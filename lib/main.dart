import 'package:flutter/material.dart';
import 'package:movieweb/screens/homeScreen.dart';
import 'package:movieweb/utils/routes/goRouter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Movie Website',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: Gorouter().router,
                );
  }
}
