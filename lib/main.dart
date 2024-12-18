import 'package:bhagavad_geeta/routes/routes.dart';
import 'package:bhagavad_geeta/screen/detail/views/detail_page.dart';
import 'package:bhagavad_geeta/screen/home/provider/home_provider.dart';
import 'package:bhagavad_geeta/screen/home/views/home_page.dart';
import 'package:bhagavad_geeta/screen/splash%20screen/view/splash_screen.dart';
import 'package:bhagavad_geeta/screen/verses/views/verses_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        Routes.splash: (context) => const SplashScreen(),
        Routes.home: (context) => const HomePage(),
        Routes.detail: (context) => const DetailPage(),
        Routes.verses: (context) => const VersesScreen(),
      }),
    );
  }
}
