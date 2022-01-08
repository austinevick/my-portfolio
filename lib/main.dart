import 'package:flutter/material.dart';
import 'package:resume_builder/routes.dart';

import 'screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Augustine Victor',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff11162a),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xff11162a))),
      home: const LandingPage(),
      builder: (context, child) => HomePage(child: child),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.landingPage,
    );
  }
}

class HomePage extends StatelessWidget {
  final Widget? child;

  const HomePage({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
