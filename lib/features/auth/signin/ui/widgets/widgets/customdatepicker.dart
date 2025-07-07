import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({super.key, required this.controller});
  final TextEditingController controller;
  DateTime initilaDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hint: Text("Dete of Birth"),
          prefixIcon: Icon(Icons.calendar_month_outlined),
        ),
      ),
    );
  }
}
