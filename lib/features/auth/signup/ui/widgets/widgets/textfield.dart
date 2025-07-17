import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/widgets/custom_text.dart';

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
          //padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: TextFormField(
            textDirection: TextDirection.rtl,
            controller: controler,
            keyboardType: keyBoardType,
            onTap: () async {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              suffixIcon: icon,
              hint: CustomText(textHint, style: GoogleFonts.cairo()),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.secendaryColor),
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
