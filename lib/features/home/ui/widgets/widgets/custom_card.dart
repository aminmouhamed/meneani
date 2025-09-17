import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/core/widgets/simpel_button.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.bgColor,
    required this.buttonText,
    required this.titel,
    required this.onPress,
    required this.bodyText,
    required this.richText,
  });
  final Color bgColor;
  final String titel;
  final String bodyText;
  final String buttonText;
  final VoidCallback onPress;
  final RichText richText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
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
                Text(
                  textDirection: TextDirection.rtl,
                  bodyText,
                  style: GoogleFonts.cairo(
                    fontSize: 35.sp,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 150.h),
                Center(
                  child: SimpelButton(text: "دخول", onPress: onPress),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 40.r,
                        left: 40.r,
                        right: 40.r,
                        bottom: 80.r,
                      ),
                      margin: EdgeInsets.all(40.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: bgColor.withAlpha(255),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: Container(
                              child: Icon(
                                Icons.question_mark,
                                size: 200.r,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          richText,
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.question_mark, size: 60.r),
            ),
          ),
        ],
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
    required this.richText,
  });
  final Color bgColor;
  final String titel;
  final String buttonText;
  final VoidCallback onPress;
  final RichText richText;

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

              Text(
                textDirection: TextDirection.rtl,
                "هذه الخدمة مبنية على نتائج أبحاث الخاصة والتي كانت تمكننا من توجيهك نحو الطريق الصحيح للشفاء ",
                style: GoogleFonts.cairo(fontSize: 35.sp),
              ),

              SizedBox(height: 150.h),
              Align(
                alignment: Alignment.bottomRight,
                child: SimpelButton(text: "دخول", onPress: onPress),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Center(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 40.r,
                      left: 40.r,
                      right: 40.r,
                      bottom: 80.r,
                    ),
                    margin: EdgeInsets.all(40.r),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: bgColor.withAlpha(255),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            child: Icon(
                              Icons.question_mark,
                              size: 200.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        richText,
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: Icon(Icons.question_mark, size: 60.r),
          ),
        ),
      ],
    );
  }
}

class CustomCard3 extends StatelessWidget {
  CustomCard3({
    super.key,
    required this.bgColor,
    required this.buttonText,
    required this.titel,
    required this.onPress,
    required this.bodyText,
  });
  final Color bgColor;
  final String titel;
  final String bodyText;
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
              bodyText,
              style: GoogleFonts.cairo(fontSize: 35.sp),
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
