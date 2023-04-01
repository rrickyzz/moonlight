import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/styles/design_system.dart';

enum textfieldType { textfieldDefault, textfieldPassword }

class PrimaryTextfield extends HookWidget {
  const PrimaryTextfield({
    Key? key,
    this.type = textfieldType.textfieldDefault,
    required this.controller,
    required this.placeholder,
    required this.onChange,
    required this.hasPrefixBox,
    this.prefixBoxContent = const SizedBox(),
    this.suffix,
    this.color = const Color(0xFF0CC978),
  }) : super(key: key);

  final textfieldType type;
  final Color color;
  final TextEditingController controller;
  final String placeholder;
  final Widget? suffix;
  final bool hasPrefixBox;
  final Widget prefixBoxContent;
  final Function(String text) onChange;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final togglePass = useState(false);
    var borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r), bottomRight: Radius.circular(8.r)),
        borderSide: BorderSide(color: color, width: 1.5));

    var passwordToggleIcon = GestureDetector(
        onTapDown: (details) {
          togglePass.value = !togglePass.value;
        },
        child: togglePass.value
            ? Icon(
                CupertinoIcons.eye,
                color: DesignSystem.foundation.primaryBackgroundA,
              )
            : Icon(
                CupertinoIcons.eye_slash,
                color: DesignSystem.foundation.primaryBackgroundA,
              ));
    var decoration = InputDecoration(
        label: Text(placeholder),
        suffix:
            type == textfieldType.textfieldDefault ? null : passwordToggleIcon,
        border: borderStyle,
        errorBorder: borderStyle,
        enabledBorder: borderStyle,
        focusedBorder: borderStyle,
        focusedErrorBorder: borderStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never);

    var textfield = SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: Row(
        children: [
          if (hasPrefixBox)
            Container(
                decoration: BoxDecoration(
                    color: DesignSystem.foundation.primaryBackgroundA,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: prefixBoxContent),
                )),
          Expanded(
            child: TextFormField(
              style: TextStyle(
                  fontSize: 14.sp,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500),
              obscureText: type == textfieldType.textfieldPassword
                  ? togglePass.value
                  : false,
              controller: controller,
              decoration: decoration,
              onChanged: (value) {
                onChange(value);
              },
            ),
          ),
        ],
      ),
    );
    return Material(
      color: Colors.transparent,
      child: textfield,
    );
  }
}
