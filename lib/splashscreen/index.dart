import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/components/primay_textfield.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

class SplashScreenPage extends HookWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final router = Routemaster.of(context);
    // Create storage
    const storage = FlutterSecureStorage();

    final provider = Provider.of<ApplicationProvider>(context);

    bool newUser = provider.checkIfNewUser;
    provider.isNewUser();
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 5000), () {
        if (newUser) {
          router.push('landing');
        } else {
          router.push('login');
        }
      });
      return;
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
                  color: Colors.white,
                  child: null,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('lib/images/books.zip', width: 250.w),
                    ),
                    Text(
                      "Buksu E-library",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: DesignSystem.foundation.primaryBackgroundA,
                          fontSize: 24.sp),
                    ).animate().scale(delay: 700.ms)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
