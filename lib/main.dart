import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/home/home.dart';
import 'package:moonlight/landingpage/index.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/routes/routes.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final RoutemasterDelegate routemaster = RoutemasterDelegate(
      routesBuilder: (context) => RouteBuilder.buildRouteMap(context),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (contex) => ApplicationProvider()),
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
            routerDelegate: routemaster,
            routeInformationParser: const RoutemasterParser(),
          ),
        );
      }),
    );
  }
}
