import 'dart:async';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'dart:developer' as dev;

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final provider = Provider.of<ApplicationProvider>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: DesignSystem.foundation.primaryBackgroundA,
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                child: null,
              ),
              SafeArea(
                child: SizedBox(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 70.h),
                      ),
                    ],
                  ),
                )),
              ),
            ],
          )),
    );
  }
}
