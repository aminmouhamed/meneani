import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/widgets/custom_text.dart';

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
  Color borderColor = Colors.white;
  late TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            Container(
              height: 150.h,
              //padding: EdgeInsets.symmetric(horizontal: 30.h),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      borderColor = Colors.red;
                    });
                    return null;
                  } else {
                    setState(() {
                      borderColor = Colors.white;
                    });
                    borderColor = Colors.white;
                    return null;
                  }
                },
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
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
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
      },
    );
  }
}
