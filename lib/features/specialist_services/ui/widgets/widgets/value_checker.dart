import 'package:flutter/material.dart';

class ValueChek extends StatelessWidget {
  ValueChek({super.key, required this.child, required this.value});
  final Widget child;
  final bool value;
  @override
  Widget build(BuildContext context) {
    if (value) {
      return child;
    }
    return Container();
  }
}
