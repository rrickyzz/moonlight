import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/provider/signup.dart';
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
    // Create storage
    final signupProvider = Provider.of<SignupProvider>(context);
    final provider = Provider.of<ApplicationProvider>(context);

    const storage = FlutterSecureStorage();
    animate() async {
      while (true) {
        await Future.delayed(const Duration(seconds: 3), () {
          if (sliderController.hasClients) {
            if (sliderController.page == 1) {
              sliderController.previousPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            } else {
              sliderController.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            }
          }
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
                                  InkWell(
                                    onTapDown: (details) {
                                      storage.write(
                                          key: 'isNewUser', value: 'false');
                                    },
                                    child: Row(
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
                                      loading: signupProvider.loading,
                                      onPressed: () {
                                        signupProvider.setLoading(true);
                                        Future.delayed(
                                            const Duration(seconds: 1),
                                            () async {
                                          // final bool hasConnection =
                                          //     await InternetConnectionChecker()
                                          //         .hasConnection;
                                          bool hasConnection = true;
                                          ;
                                          if (hasConnection) {
                                            router.push('/signup');
                                            signupProvider.setLoading(false);
                                          } else {
                                            var dialog = AlertDialog(
                                              title: const Icon(
                                                Icons.wifi_off,
                                                color: Colors.red,
                                              ),
                                              actions: [
                                                PrimaryButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    label: 'Close')
                                              ],
                                            );

                                            // ignore: use_build_context_synchronously
                                            showDialog(
                                                context: context,
                                                builder: (v) => dialog);
                                          }
                                        });
                                      },
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
