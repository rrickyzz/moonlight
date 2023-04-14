import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_stepper/stepper.dart';
import 'package:moonlight/components/button_primary.dart';
import 'package:moonlight/components/dropdown.dart';
import 'package:moonlight/components/primay_textfield.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'dart:developer' as dev;

class SignupPage extends HookWidget {
  const SignupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final router = Routemaster.of(context);
    // Create storage
    const storage = FlutterSecureStorage();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final middleNameController = useTextEditingController();

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final provider = Provider.of<ApplicationProvider>(context);
    final sliderController = usePageController();

    List<String> college = [
      'College of Technologies',
      'College of Education',
      'College of Nursing'
    ];

    List<String> course = [
      'Bachelor of Science in Information Technology',
      'Bachelor of Science in Business Administration',
      'Bachelor of Science in Physical Education',
    ];

    List<String> year = [
      'First year',
      'Second year',
      'Third year',
      'Fourth year'
    ];
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
            controller: lastNameController,
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
            controller: middleNameController,
            placeholder: 'Middle Name',
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
          child: DropdownCustom(values: college),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: DropdownCustom(
              values: course,
            )),
        Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: DropdownCustom(
              values: year,
            )),
        Expanded(
          child: Column(
            children: [
              Align(
                alignment: provider.signupSliderIndex < 2
                    ? Alignment.topRight
                    : Alignment.center,
                child: SizedBox(
                  width: 150.w,
                  child: PrimaryButton(
                      enabled: firstNameController.text.trim().isNotEmpty &&
                          lastNameController.text.trim().isNotEmpty &&
                          middleNameController.text.trim().isNotEmpty,
                      suffix: provider.signupSliderIndex < 2
                          ? const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            )
                          : null,
                      onPressed: () async {
                        if (provider.signupSliderIndex < 2) {
                          provider.setSignupSliderIndex();
                          sliderController.animateToPage(
                              provider.signupSliderIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          router.push('/home');
                        }
                      },
                      label:
                          provider.signupSliderIndex < 2 ? 'Next' : 'Verify'),
                ),
              )
            ],
          ),
        ),
      ],
    );

    var page2 = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: emailController,
            placeholder: 'Email',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            type: textfieldType.textfieldPassword,
            controller: passwordController,
            placeholder: 'Password',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.key,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            type: textfieldType.textfieldPassword,
            controller: confirmPasswordController,
            placeholder: 'Confirm Password',
            onChange: (s) {},
            hasPrefixBox: true,
            prefixBoxContent: const Icon(
              Icons.key,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Align(
                alignment: provider.signupSliderIndex < 2
                    ? Alignment.topRight
                    : Alignment.center,
                child: SizedBox(
                  width: 150.w,
                  child: PrimaryButton(
                      enabled: emailController.text.trim().isNotEmpty &&
                          passwordController.text.trim().isNotEmpty &&
                          confirmPasswordController.text.trim().isNotEmpty,
                      suffix: provider.signupSliderIndex < 2
                          ? const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            )
                          : null,
                      onPressed: () async {
                        if (provider.signupSliderIndex < 2) {
                          provider.setSignupSliderIndex();
                          sliderController.animateToPage(
                              provider.signupSliderIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        } else {
                          router.push('/home');
                        }
                      },
                      label:
                          provider.signupSliderIndex < 2 ? 'Next' : 'Verify'),
                ),
              )
            ],
          ),
        ),
      ],
    );

    var page3 = Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: PrimaryTextfield(
            controller: firstNameController,
            placeholder: 'Enter verification code',
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
    return WillPopScope(
      onWillPop: () async {
        dev.log('back pressed');
        return false;
      },
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: SizedBox(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20.h,
                      ),
                      NumberStepper(
                          enableNextPreviousButtons: false,
                          activeStepColor:
                              DesignSystem.foundation.primaryBackgroundA,
                          activeStep: provider.signupSliderIndex,
                          stepRadius: 12.r,
                          lineColor: DesignSystem.foundation.primaryBackgroundA,
                          numbers: const [
                            1,
                            2,
                            3,
                          ]),
                      Expanded(
                        flex: 4,
                        child: PageView(
                          controller: sliderController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [page1, page2, page3],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          )),
    );
  }
}
