import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/widgets/custom_text.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({
    super.key,
    required this.controller,
    required this.textHint,
  });
  final TextEditingController controller;
  final String textHint;
  DateTime initilaDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        textDirection: TextDirection.rtl,
        controller: controller,
        onTap: () async {
          DateTime? berthDate = await showDatePicker(
            initialDate: initilaDate,
            context: context,
            firstDate: DateTime(1980),
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hint: CustomText(textHint, style: GoogleFonts.cairo()),
          suffixIcon: Icon(Icons.calendar_month_outlined),
        ),
      ),
    );
  }
}
