import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/widgets/simpel_button.dart';

class Wallet extends StatelessWidget {
  Wallet({
    super.key,
    required this.bgColor,
    required this.buttonText,
    required this.titel,
    required this.onPress,
  });
  final Color bgColor;
  final String titel;
  final String buttonText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          padding: EdgeInsets.all(40.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // "Online Doctor  Conseltation",
                titel,
                textDirection: TextDirection.rtl,
                style: GoogleFonts.cairo(
                  fontSize: 45.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.h),

              Center(
                child: FittedBox(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    "1000000 دج",
                    style: GoogleFonts.cairo(
                      fontSize: 120.sp,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 241, 238, 238),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50.h),
              Align(
                alignment: Alignment.bottomRight,
                child: SimpelButton(text: "دخول", onPress: onPress),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
