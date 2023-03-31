import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final sliderController = usePageController();
    final router = Routemaster.of(context);
    // Create storage
    const storage = FlutterSecureStorage();

    useEffect(() {
      return () => {};
    }, []);

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
                          children: [],
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
                                      label: 'Login')
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
