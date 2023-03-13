import 'package:flutter/cupertino.dart';
import 'package:moonlight/styles/colours.dart';

class DesignSystem {
  static ColourFoundation foundation = ColourFoundation(
    const Color(0xFF31373C),
    const Color(0XFF727679),
    const Color(0xFFE9E9E9),
    const Color(0xFF898A8D),
    const Color(0xFF50555C),
    const Color(0xFFEFF0F6),
    const Color(0xFF6E7191),
    const Color(0xFF3672E7),
    const Color(0xFF979797),
    const Color(0xFF000000),
    const Color(0xFFFFFFFF),
    const Color(0xFFC04195),
    const Color(0xFF666666),
  );

  static String fontFamily = 'Poppins';
}

class ThemeSystem {
  static CupertinoThemeData themeData = CupertinoThemeData(
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(fontFamily: 'Poppins'),
    ),
    scaffoldBackgroundColor: DesignSystem.foundation.white,
  );
}
