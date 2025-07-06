import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    controller.text = "Gender";
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
            borderRadius: BorderRadius.circular(10),
            value: controller.text,
            elevation: 3,
            underline: Container(),
            isExpanded: true,

            items: [
              DropdownMenuItem<String>(child: Text("Gender"), value: "Gender"),
              DropdownMenuItem<String>(child: Text("Male"), value: "male"),
              DropdownMenuItem<String>(child: Text("Female"), value: "female"),
            ],
            onChanged: (String? value) {
              controller.text = value!;
              print(controller.text);
            },
          ),
        ),
      ),
    );
  }
}

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

            items: [
              DropdownMenuItem<String>(child: Text("Gender"), value: "Gender"),
              DropdownMenuItem<String>(child: Text("Male"), value: "male"),
              DropdownMenuItem<String>(child: Text("Female"), value: "female"),
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
