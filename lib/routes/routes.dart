import 'package:flutter/cupertino.dart';
import 'package:moonlight/landingpage/index.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteBuilder {
  static RouteMap buildRouteMap(BuildContext context) {
    ScreenUtil.init(context);

    var noCredentials = true;
    if (noCredentials) {
      return RouteMap(onUnknownRoute: (_) => const Redirect('/'), routes: {
        '/': (_) =>
            const CupertinoPage(name: "LandingPage", child: LandingPage()),
      });
    }
  }
}
