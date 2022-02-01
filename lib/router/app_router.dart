import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangacafe_v2/modules/home/data/home_cubit.dart';
import 'package:mangacafe_v2/modules/home/ui/screens/home_screen.dart';
import 'package:mangacafe_v2/modules/intro/ui/screens/intro_screen.dart';
import 'package:mangacafe_v2/modules/splash/data/splash_cubit.dart';
import 'package:mangacafe_v2/modules/splash/ui/screens/splash_scree.dart';

class AppRouter {
  static const String splashScreen = "/";
  static const String introScreen = "/intro";
  static const String homeScreen = "/home";

  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => SplashCubit(),
            child: const SplashScreen(),
          ),
        );

      case introScreen:
        return MaterialPageRoute(
          builder: (context) => IntroScreen(),
          settings: settings,
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => HomeCubit(),
            child: const HomeScreen(),
          ),
        );
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text("not found"),
        ),
      ),
    );
  }
}
