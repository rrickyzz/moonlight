import 'package:flutter/cupertino.dart';
import 'package:moonlight/home/home.dart';
import 'package:moonlight/landingpage/index.dart';
import 'package:moonlight/login/index.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/signup/index.dart';
import 'package:moonlight/splashscreen/index.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer' as dev;

class RouteBuilder {
  static RouteMap buildRouteMap(BuildContext context) {
    ScreenUtil.init(context);
    final provider = Provider.of<ApplicationProvider>(context);

    var noCredentials = true;

    provider.isNewUser();
    if (noCredentials) {
      return RouteMap(onUnknownRoute: (_) => const Redirect('/'), routes: {
        // '/': (_) => CupertinoPage(
        //     name: "EntryPage",
        //     child: newUser ? const LandingPage() : const LoginPage()),
        '/': (_) =>
            const CupertinoPage(name: "EntryPage", child: SplashScreenPage()),

        '/landing': (_) =>
            const CupertinoPage(name: "EntryPage", child: LandingPage()),

        '/login': (_) =>
            const CupertinoPage(name: "EntryPage", child: LoginPage()),
        '/signup': (_) =>
            const CupertinoPage(name: "Signup", child: SignupPage()),
        '/home': (_) => const CupertinoPage(name: "Home", child: HomePage()),
      });
    }
  }
}
