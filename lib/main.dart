import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/home/home.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/provider/signup.dart';
import 'package:moonlight/routes/routes.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routerConfig = RouteBuilder.buildRoutes;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (contex) => ApplicationProvider()),
        ChangeNotifierProvider(create: (contex) => SignupProvider()),
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return Theme(
          data: ThemeData(fontFamily: 'Poppins'),
          child: CupertinoApp.router(
            theme: ThemeSystem.themeData,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            routerConfig: routerConfig,
          ),
        );
      }),
    );
  }
}
