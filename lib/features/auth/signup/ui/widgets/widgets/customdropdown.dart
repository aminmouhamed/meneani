import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/widgets/custom_text.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomDropDownMenu> createState() =>
      _CustomDropDownMenuState(controller: controller);
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  final TextEditingController controller;

  _CustomDropDownMenuState({required this.controller});
  @override
  Widget build(BuildContext context) {
    if (controller.text == null || controller.text == "") {
      controller.text = "Gender";
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton<String>(
            value: controller.text,
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            underline: Container(),
            isExpanded: true,
            alignment: Alignment.centerRight,
            dropdownColor: Colors.white,
            items: [
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText("الجنس", style: GoogleFonts.cairo()),
                value: "Gender",
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(style: GoogleFonts.cairo(), "ذكر"),
                value: "male",
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(style: GoogleFonts.cairo(), "أنثى"),
                value: "female",
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                controller.text = value!;
                print(controller.text);
              });
            },
          ),
        ),
      ),
    );
  }
}

class CustomDropDownMenu2 extends StatefulWidget {
  const CustomDropDownMenu2({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<CustomDropDownMenu2> createState() =>
      _CustomDropDownMenuState2(controller: controller);
}

class _CustomDropDownMenuState2 extends State<CustomDropDownMenu2> {
  final TextEditingController controller;
  List<String> specialistType = [
    "مختص في الأمراض العقلية",
    "مختص في الإدمان",
    "مختص في الفيزيوجيا",
    "مختص نفسي عيادي",
    "مختص نفس عصبي",
    "مختص في التغذية",
    "مختص أرطفوني '(علم الأعصاب اللغوي العيادي)",
  ];
  _CustomDropDownMenuState2({required this.controller});
  @override
  Widget build(BuildContext context) {
    if (controller.text == null || controller.text == "") {
      controller.text = specialistType[0];
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButton<String>(
            value: controller.text,
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            underline: Container(),
            isExpanded: true,
            alignment: Alignment.centerRight,
            dropdownColor: Colors.white,
            items: [
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[0],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[0],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[1],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[1],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[2],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[2],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[3],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[3],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[4],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[4],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[5],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[5],
              ),
              DropdownMenuItem<String>(
                alignment: Alignment.centerRight,
                child: CustomText(
                  specialistType[6],
                  style: GoogleFonts.cairo(),
                ),
                value: specialistType[6],
              ),
            ],
            onChanged: (String? value) {
              setState(() {
                controller.text = value!;
                print(controller.text);
              });
            },
          ),
        ),
      ),
    );
  }
}
