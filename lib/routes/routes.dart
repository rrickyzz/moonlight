import 'package:flutter/cupertino.dart';
import 'package:moonlight/landingpage/index.dart';
import 'package:moonlight/login/index.dart';
import 'package:moonlight/provider/application.dart';
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
    bool newUser = provider.checkIfNewUser;
    if (noCredentials) {
      return RouteMap(onUnknownRoute: (_) => const Redirect('/'), routes: {
        '/': (_) => CupertinoPage(
            name: "EntryPage",
            child: newUser ? const LandingPage() : const LoginPage()),
      });
    }
  }
}
