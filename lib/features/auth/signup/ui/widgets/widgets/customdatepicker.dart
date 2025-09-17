import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/widgets/custom_text.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    super.key,
    required this.controller,
    required this.textHint,
  });
  final TextEditingController controller;
  final String textHint;
  DateTime initilaDate = DateTime.now();
  Color borderColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 150.h,
          padding: EdgeInsets.symmetric(horizontal: 0),
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
            controller: controller,
            onTap: () async {
              DateTime? berthDate = await showDatePicker(
                locale: Locale("fr"),
                initialDate: initilaDate,
                context: context,
                firstDate: DateTime(1965),
                lastDate: DateTime.now(),
              );
              if (berthDate != null) {
                String? date =
                    "${berthDate.day}/${berthDate.month}/${berthDate.year}";
                this.controller.text = date;
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
                borderRadius: BorderRadius.circular(10),
              ),
              hint: CustomText(textHint, style: GoogleFonts.cairo()),
              suffixIcon: Icon(
                Icons.calendar_month_outlined,
                color: Colors.black54,
              ),
            ),
          ),
        );
      },
    );
  }
}
