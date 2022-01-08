import 'package:flutter/material.dart';
import 'package:resume_builder/screens/about_page.dart';
import 'package:resume_builder/screens/landing_page.dart';
import 'package:resume_builder/screens/project_page.dart';

class RoutesName {
  static const String landingPage = '/landing_page';
  static const String projectPage = '/project_page';
  static const String about = '/about_page';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.landingPage:
        return GeneratePageRoute(
            widget: const LandingPage(), routeName: settings.name);
      case RoutesName.projectPage:
        return GeneratePageRoute(
            widget: const Projectpage(), routeName: settings.name);
      case RoutesName.about:
        return GeneratePageRoute(
            widget: const AboutPage(), routeName: settings.name);
      default:
        return GeneratePageRoute(
            widget: const LandingPage(), routeName: settings.name);
    }
  }
}

class GeneratePageRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;
  GeneratePageRoute({this.widget, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget!;
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                textDirection: TextDirection.rtl,
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
