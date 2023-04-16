import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:moonlight/provider/application.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends HookWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final applicationProvider = Provider.of<ApplicationProvider>(context);
    String headerTitleByIndex() {
      switch (applicationProvider.bottomTabIndex) {
        case 1:
          return 'Downloads';
        case 2:
          return 'Browse';
        case 3:
          return 'Profile';
      }
      return 'Home';
    }

    getBodyByTabIndex() {
      switch (applicationProvider.bottomTabIndex) {
        case 0:
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi Grills, Welcome back',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(21, 16, 21, 16),
                    decoration: BoxDecoration(
                        color: const Color(0XFF262A34),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'O min ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Completed this week',
                                    style: TextStyle(
                                        color: const Color(0XFFF3EDB9),
                                        fontSize: 9.sp),
                                  ),
                                )
                              ],
                            ),
                            const Icon(Icons.edit_outlined,
                                color: Color(0XFF37F3FF))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200.w,
                                child: const LinearProgressIndicator(
                                  value: 0,
                                  backgroundColor: Color(0XFFD9D9D9),
                                ),
                              ),
                              Text(
                                'O min ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(21, 16, 21, 16),
                    decoration: BoxDecoration(
                        color: const Color(0XFF262A34),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Stack(children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset('lib/images/mobile.svg')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: Text(
                              'Welcome to ABCCA!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 11.0),
                            child: Text(
                              'Online class for Senior High School',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            'Learn anywhere & anytime',
                            style: TextStyle(
                                color: const Color(0XFF37F3FF),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: Text(
                    'Access your lessons here',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200.h,
                  padding: const EdgeInsets.fromLTRB(21, 16, 21, 16),
                  decoration: BoxDecoration(
                      color: const Color(0XFF262A34),
                      borderRadius: BorderRadius.circular(12.r)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.folder_copy,
                          color: Color(0XFF37F3FF),
                          size: 52,
                        ),
                        Text(
                          'No lessons available yet',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ]),
                )
              ],
            ),
          );

        case 1:
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: SizedBox(
                  child: SvgPicture.asset('lib/images/coming_soon.svg')),
            ),
          );
        case 2:
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: SizedBox(
                  child: SvgPicture.asset('lib/images/coming_soon.svg')),
            ),
          );
        case 3:
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: SizedBox(
                  child: SvgPicture.asset('lib/images/coming_soon.svg')),
            ),
          );
      }

      return Column(
        children: const [],
      );
    }

    useEffect(() {
      Future.microtask(() => {});
      return;
    }, [applicationProvider.bottomTabIndex]);
    return WillPopScope(
      onWillPop: () async {
        context.pop();
        return false;
      },
      child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: const Color(0XFF1E1E1E),
            automaticallyImplyLeading: false,
            leadingWidth: 200.w,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
              child: Text(
                headerTitleByIndex(),
                style: TextStyle(color: Colors.white, fontSize: 24.sp),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 24,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 24,
                    color: Colors.white,
                  ))
            ],
          ),
          bottomNavigationBar: Container(
            height: 80.h,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                ]),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: Theme(
                data: ThemeData(canvasColor: const Color(0XFF2E2E2E)),
                child: BottomNavigationBar(
                  onTap: (index) {
                    applicationProvider.setTabIndex(index);
                  },
                  currentIndex: applicationProvider.bottomTabIndex,
                  unselectedIconTheme: const IconThemeData(color: Colors.grey),
                  unselectedLabelStyle:
                      TextStyle(color: Colors.grey, fontSize: 10.sp),
                  selectedLabelStyle:
                      TextStyle(color: Colors.white, fontSize: 10.sp),
                  showUnselectedLabels: true,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Badge(child: Icon(Icons.home)),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.download),
                      label: 'Downloads',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.amp_stories),
                      label: 'Browse',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E1E),
                ),
                child: null,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          getBodyByTabIndex()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
