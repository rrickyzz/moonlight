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

    String convertDuration(Duration? duration) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      if (duration != null) {
        String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
        String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
        return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
      }
      return "";
    }

    Future.microtask(
      () {
        provider.initSongs();
        provider.initPlayer();
      },
    );

    dev.inspect(provider.songs);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: DesignSystem.foundation.primaryBackgroundA,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            centerTitle: true,
            backgroundColor: DesignSystem.foundation.primaryBackgroundA,
            leading: Padding(
              padding: const EdgeInsets.all(4.0),
              child: NeumorphicButton(
                onPressed: () {},
                style: NeumorphicStyle(
                  shadowLightColor: Colors.grey,
                  lightSource: LightSource.top,
                  color: DesignSystem.foundation.primaryBackgroundA,
                  shape: NeumorphicShape.convex,
                  boxShape: const NeumorphicBoxShape.circle(),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.arrow_back,
                  color: DesignSystem.foundation.primaryBackgroundB,
                ),
              ),
            ),
            title: Text(
              "${provider.connectionStatus}",
              style: TextStyle(
                  color: DesignSystem.foundation.primaryBackgroundB,
                  fontSize: 12),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: NeumorphicButton(
                  onPressed: () {
                    provider.player.positionStream.listen((event) {});
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.grey,
                    lightSource: LightSource.top,
                    color: DesignSystem.foundation.primaryBackgroundA,
                    shape: NeumorphicShape.convex,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.menu,
                    color: DesignSystem.foundation.primaryBackgroundB,
                  ),
                ),
              )
            ],
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: () {
                    provider.player.positionStream.listen((event) {
                      provider.player.pause();
                      provider.player.seek(event - const Duration(seconds: 10));
                    });
                  },
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.grey,
                    lightSource: LightSource.top,
                    color: DesignSystem.foundation.primaryBackgroundA,
                    shape: NeumorphicShape.convex,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: Icon(
                      Icons.keyboard_double_arrow_left_rounded,
                      color: DesignSystem.foundation.primaryBackgroundB,
                    ),
                  ),
                ),
                NeumorphicButton(
                  onPressed: () async {
                    if (provider.player.playing) {
                      provider.player.pause();

                      return;
                    }

                    await provider.play();
                  },
                  style: const NeumorphicStyle(
                    shadowLightColor: Colors.grey,
                    lightSource: LightSource.top,
                    color: Color(0XFFEB4712),
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: StreamBuilder(
                        stream: provider.player.positionStream,
                        builder: ((context, snapshot) {
                          return Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 32,
                          );
                        })),
                  ),
                ),
                NeumorphicButton(
                  onPressed: () {},
                  style: NeumorphicStyle(
                    shadowLightColor: Colors.grey,
                    lightSource: LightSource.top,
                    color: DesignSystem.foundation.primaryBackgroundA,
                    shape: NeumorphicShape.convex,
                    boxShape: const NeumorphicBoxShape.circle(),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 50.w,
                    height: 50.h,
                    child: Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      color: DesignSystem.foundation.primaryBackgroundB,
                    ),
                  ),
                )
              ],
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
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50.h),
                          child: Neumorphic(
                            drawSurfaceAboveChild: false,
                            style: NeumorphicStyle(
                              shadowDarkColor:
                                  const Color(0XFFEB4712).withOpacity(0.8),
                              shadowLightColor: Colors.grey,
                              lightSource: LightSource.top,
                              color: DesignSystem.foundation.primaryBackgroundA,
                              shape: NeumorphicShape.convex,
                              depth: 20,
                              boxShape: const NeumorphicBoxShape.circle(),
                            ),
                            child: Image.network(
                              'https://iscale.iheart.com/v3/surl/aHR0cDovL2ltYWdlLmloZWFydC5jb20vaW1hZ2VzL3JvdmkvMTA4MC8wMDA1LzA3OC9NSTAwMDUwNzg4NDcuanBn?sn=eGtleWJhc2UyMDIxMTExMDr4gp6__kOWnjKbX6Qwu0O58epCgZoqFud5B7uUNpJQ2A%3D%3D&surrogate=1cOXl179JY-syhxYSCX6Q1a_Mcu6UO8d-F4oJzpZf1hcUbJr4aImxdIBFU_jwAxamYVfZ61GyfCCdtOIh5AaoYt-9we6rQhNU73SyOo-xCGhFiM4xwGKilTvM1IC9XYlOuR-HA7JCgPuzB0i-YPQnzf5Z61sBMvyTwD7eLJzg3xsHVIL-e3uSHM5slngxZbf64deTis3L5CfsQuCs_wyAZHRpIfceQFFNLE%3D',
                              fit: BoxFit.cover,
                              scale: 1,
                              colorBlendMode: BlendMode.overlay,
                              filterQuality: FilterQuality.high,
                              errorBuilder: (context, error, stackTrace) =>
                                  Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Text(
                                  error.toString(),
                                  style: const TextStyle(color: Colors.amber),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 70.h, left: 8.w, right: 8.w),
                          child: Column(
                            children: [
                              StreamBuilder(
                                  stream: provider.player.positionStream,
                                  builder: ((context, snapshot) {
                                    return Text(
                                      'Title String',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 24.sp),
                                    );
                                  })),
                              Text(
                                'Artist String',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.sp),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      StreamBuilder(
                                          stream:
                                              provider.player.positionStream,
                                          builder: ((context, snapshot) {
                                            return Text(
                                              'String',
                                              style: TextStyle(
                                                  color: DesignSystem.foundation
                                                      .primaryBackgroundB),
                                            );
                                          })),
                                      StreamBuilder(
                                          stream:
                                              provider.player.positionStream,
                                          builder: ((context, snapshot) {
                                            return Text(
                                              'String',
                                              style: TextStyle(
                                                  color: DesignSystem.foundation
                                                      .primaryBackgroundB),
                                            );
                                          })),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 5.h),
                      //   child: StreamBuilder(
                      //       stream: provider.player.positionStream,
                      //       builder: ((context, snapshot) {
                      //         return NeumorphicSlider(
                      //           min: 0,
                      //           max: provider.max.value.inSeconds.toDouble(),
                      //           onChangeEnd: (percent) async {
                      //             provider.player.seek(Duration(
                      //                 milliseconds:
                      //                     (provider.max.value.inSeconds *
                      //                             percent ~/
                      //                             1000)
                      //                         .toInt()));
                      //           },
                      //           style: const SliderStyle(
                      //               thumbBorder: NeumorphicBorder(
                      //                   width: 10, color: Color(0XFF22262B)),
                      //               accent: Colors.amber,
                      //               variant: Color(0XFFEB4712)),
                      //           value: snapshot.data!.inSeconds <
                      //                   provider.max.value.inSeconds
                      //               ? snapshot.data!.inSeconds.toDouble()
                      //               : provider.min.value,
                      //         );
                      //       })),
                      // ),
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
