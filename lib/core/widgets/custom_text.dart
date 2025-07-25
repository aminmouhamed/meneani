import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends Text {
  CustomText(
    super.data, {
    super.key,
    super.textDirection = TextDirection.rtl,
    super.maxLines = 2,
    super.overflow = TextOverflow.ellipsis,
    super.style,
  });
}
