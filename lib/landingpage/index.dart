import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class LandingPage extends HookWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final sliderController = usePageController();
    final router = Routemaster.of(context);

    animate() async {
      while (true) {
        await Future.delayed(const Duration(seconds: 3), () {
          sliderController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceIn);
        });
      }
    }

    useEffect(() {
      animate();
      return () => {};
    }, []);
    var page1 = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 120.h),
          child: Image.network(
            'https://cdn.dribbble.com/users/942818/screenshots/16931572/media/b13cf2412257aaf031f4072973ff2fb7.jpg?compress=1&resize=840x630&vertical=top',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            'Read books \nwith no boundaries',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );

    var page2 = Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 120.h),
          child: Image.network(
            'https://cdn.dribbble.com/users/942818/screenshots/16931572/media/d76dbc9501b20d6cfa1a0952eed1a441.jpg?compress=1&resize=840x630&vertical=top',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            'Never stop learning',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
    var container = SizedBox(
      height: 450.h,
      width: MediaQuery.of(context).size.width,
      child: PageView(
        controller: sliderController,
        children: [page1, page2],
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(color: DesignSystem.foundation.white),
                  child: null,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 7.h),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Skip',
                                        style: TextStyle(
                                            color:
                                                DesignSystem.foundation.black,
                                            fontSize: 18.sp),
                                      ),
                                      const Icon(
                                        Icons.skip_next,
                                        size: 32,
                                        color: Color(0XFF1CAEB1),
                                      )
                                    ],
                                  ),
                                ])),
                            container
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  PrimaryButton(
                                      onPressed: () => print('hello'),
                                      label: 'Start an Account')
                                ],
                              ),
                            ),
                          )),
                    ],
                  )),
                ),
              ],
            ),
          )),
    );
  }
}
