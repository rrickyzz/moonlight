import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/components/primay_textfield.dart';
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
    final firstNameController = useTextEditingController();
    useEffect(() {
      return () => {};
    }, []);

    var page1 = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: firstNameController,
            placeholder: 'First Name',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: firstNameController,
            placeholder: 'Last Name',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: firstNameController,
            placeholder: 'Middle Name',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    var page2 = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: firstNameController,
            placeholder: 'Email',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            type: textfieldType.textfieldPassword,
            controller: firstNameController,
            placeholder: 'Password',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              CupertinoIcons.eye,
              color: Colors.white,
            ),
          ),
        ),
      ],
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
                      SizedBox(height: 200.h),
                      Expanded(
                        flex: 4,
                        child: PageView(
                          children: [page1, page2],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SizedBox(
                                      width: 150.w,
                                      child: PrimaryButton(
                                          suffix: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Colors.white,
                                          ),
                                          onPressed: () => print('hello'),
                                          label: 'Next'),
                                    ),
                                  )
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
