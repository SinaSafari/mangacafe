import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangacafe_v2/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: 'mangacafe',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGeneratedRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      initialRoute: "/",
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      theme: ThemeData(
        fontFamily: 'BYekan',
        primarySwatch: Colors.blue,
      ),
    );
  }
}
