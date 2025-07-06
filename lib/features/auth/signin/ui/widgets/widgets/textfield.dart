import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.textHint,
    this.controler,
    required this.icon,
  });
  final String textHint;
  final Icon icon;
  late TextEditingController? controler;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextFormField(
            controller: controler,
            onTap: () async {},
            decoration: InputDecoration(
              prefixIcon: icon,
              hint: Text(textHint),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
