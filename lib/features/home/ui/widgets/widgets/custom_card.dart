import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/core/widgets/simpel_button.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    super.key,
    required this.bgColor,
    required this.buttonText,
    required this.titel,
  });
  final Color bgColor;
  final String titel;
  final String buttonText;

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
              style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Start from ", style: TextStyle(fontSize: 30.sp)),
                Text(
                  "1500 Da/Doctor  ",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("you Can", style: TextStyle(fontSize: 30.sp)),
              ],
            ),
            Text(
              "online consultations now!. ",
              style: TextStyle(fontSize: 30.sp),
            ),

            SizedBox(height: 150.h),
            Center(child: SimpelButton()),
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
  });
  final Color bgColor;
  final String titel;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: TextStyle(fontSize: 45.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Start from ", style: TextStyle(fontSize: 30.sp)),
              Text(
                "1500 Da/Doctor  ",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Text("you Can", style: TextStyle(fontSize: 30.sp)),
            ],
          ),
          Text(
            "online consultations now!. ",
            style: TextStyle(fontSize: 30.sp),
          ),

          SizedBox(height: 150.h),
          Align(alignment: Alignment.bottomRight, child: SimpelButton()),
        ],
      ),
    );
  }
}
