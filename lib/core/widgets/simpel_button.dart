import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimpelButton extends StatefulWidget {
  const SimpelButton({super.key});

  @override
  State<SimpelButton> createState() => _SimpelButtonState();
}

class _SimpelButtonState extends State<SimpelButton> {
  Color color = Colors.white;
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
      },
      child: AnimatedContainer(
        padding: EdgeInsets.only(
          left: 75.h,
          right: 75.h,
          top: 20.h,
          bottom: 20.h,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9),
        ),
        duration: Duration(microseconds: 1000),
        child: Text("Find Doctor", style: TextStyle(fontSize: 35.sp)),
      ),
    );
  }
}
