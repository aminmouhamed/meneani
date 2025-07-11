import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpelButton extends StatefulWidget {
  SimpelButton({super.key, required this.text, required this.onPress});
  final String text;
  final VoidCallback onPress;
  @override
  State<SimpelButton> createState() =>
      _SimpelButtonState(text: this.text, onpress: this.onPress);
}

class _SimpelButtonState extends State<SimpelButton> {
  Color color = Colors.white;
  final String text;
  final VoidCallback onpress;

  _SimpelButtonState({required this.text, required this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          color = Colors.black12;
        });
      },
      onTapUp: (_) {
        setState(() {
          color = Colors.white;
        });
        onpress();
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(
          left: 75.h,
          right: 75.h,
          top: 15.h,
          bottom: 15.h,
        ),
        decoration: BoxDecoration(
          //border: Border.all(),
          color: color,
          borderRadius: BorderRadius.circular(9),
        ),
        duration: Duration(microseconds: 2000),
        child: Text(
          textDirection: TextDirection.rtl,
          text,
          style: GoogleFonts.cairo(fontSize: 35.sp),
        ),
      ),
    );
  }
}
