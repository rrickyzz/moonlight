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
    this.suffix,
    this.color = const Color(0xFF0CC978),
  }) : super(key: key);

  final textfieldType type;
  final Color color;
  final TextEditingController controller;
  final String placeholder;
  final Widget? suffix;
  final Function(String text) onChange;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final togglePass = useState(false);
    var borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(color: color, width: 1.5));
    var passwordToggleIcon = GestureDetector(
        onTapDown: (details) => !togglePass.value,
        child: togglePass.value
            ? const Icon(CupertinoIcons.eye)
            : const Icon(CupertinoIcons.eye_slash));
    var decoration = InputDecoration(
        label: Text(placeholder),
        suffix: type == textfieldType.textfieldDefault
            ? suffix
            : passwordToggleIcon,
        border: borderStyle,
        floatingLabelBehavior: FloatingLabelBehavior.never);

    var textfield = TextFormField(
      controller: controller,
      decoration: decoration,
      onChanged: (value) {
        onChange(value);
      },
    );
    return Material(
      color: Colors.transparent,
      child: textfield,
    );
  }
}
