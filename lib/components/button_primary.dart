import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/styles/design_system.dart';

class PrimaryButton extends HookWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.color = Colors.amber,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String label;
  final Function onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var primaryBtnStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.resolveWith(
          (states) => Size(MediaQuery.of(context).size.width, 40.h)),
      shape: MaterialStateProperty.resolveWith((states) =>
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r))),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        const Set<MaterialState> interactiveStates = <MaterialState>{
          MaterialState.disabled
        };
        return states.any(interactiveStates.contains)
            ? Colors.grey.withOpacity(.7)
            : color;
      }),
    );
    var button = ElevatedButton(
        style: primaryBtnStyle,
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: TextStyle(
              letterSpacing: 1.2, fontSize: 18.sp, fontWeight: FontWeight.w700),
        ));

    return Material(
      color: Colors.transparent,
      child: button,
    );
  }
}
