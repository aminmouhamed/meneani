import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/widgets/simpel_button.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
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
    return Expanded(
      child: Container(
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
            Text(
              textDirection: TextDirection.rtl,
              "يمكنك حجز موعد مع الطبيب ابتداءا من مبلغ 1000دج",
              style: GoogleFonts.cairo(fontSize: 30.sp),
            ),

            SizedBox(height: 150.h),
            Center(
              child: SimpelButton(text: "دخول", onPress: onPress),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  CustomCard2({
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
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.all(40.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
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

          Text(
            textDirection: TextDirection.rtl,
            "هذه الخدمة مبنية على نتائج أبحاث الخاصة والتي كانت تمكننا من توجيهك نحو الطريق الصحيح للشفاء ",
            style: GoogleFonts.cairo(fontSize: 30.sp),
          ),

          SizedBox(height: 150.h),
          Align(
            alignment: Alignment.bottomRight,
            child: SimpelButton(text: "دخول", onPress: onPress),
          ),
        ],
      ),
    );
  }
}
