import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moonlight/styles/design_system.dart';

class DropdownCustom extends HookWidget {
  const DropdownCustom({
    Key? key,
    required this.values,
  }) : super(key: key);

  final List<String> values;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final current = useState(values.first);
    var dropdown = SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.5, color: DesignSystem.foundation.primaryBackgroundA),
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r)),
        child: DropdownButton<String>(
          alignment: Alignment.center,
          dropdownColor: Colors.white,
          value: current.value,
          underline: const SizedBox(child: null),
          icon: Icon(
            Icons.arrow_downward,
            color: DesignSystem.foundation.primaryBackgroundA,
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          onChanged: (String? value) {
            // This is called when the user selects an item.
            current.value = value!;
          },
          items: values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 105.w,
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500),
                  )),
            );
          }).toList(),
        ),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: dropdown,
    );
  }
}
