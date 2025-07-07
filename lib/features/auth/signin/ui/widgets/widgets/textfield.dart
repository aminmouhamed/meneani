import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.textHint,
    this.controler,
    required this.icon,
    this.keyBoardType = TextInputType.text,
  });
  final String textHint;
  final Icon icon;
  late TextEditingController? controler;
  late TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.h,
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: TextFormField(
            controller: controler,
            keyboardType: keyBoardType,
            onTap: () async {},
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: icon,
              hint: Text(textHint),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
