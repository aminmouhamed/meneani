import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowDialogErrorHandler {
  static void showErrorDialog(BuildContext context, String errorMassege) async {
    switch (errorMassege) {
      case "Anonymous sign-ins are disabled":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'الرجاء إدخال معلوماتك .',
            titleTextStyle: GoogleFonts.cairo(),
            descTextStyle: GoogleFonts.cairo(),
            btnOkOnPress: () {},
          )
          ..show();
        break;
      case "missing email or phone":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'البريد الإلكتروني أو الهاتف مفقود.',
            titleTextStyle: GoogleFonts.cairo(),
            descTextStyle: GoogleFonts.cairo(),
            btnOkOnPress: () {},
          )
          ..show();
        break;
      case "Invalid login credentials":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'بيانات اعتماد تسجيل الدخول غير صالحة .',
            titleTextStyle: GoogleFonts.cairo(),
            descTextStyle: GoogleFonts.cairo(),
            btnOkOnPress: () {},
          )
          ..show();
        break;
      case "User already registered":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: 'المستخدم مسجل بالفعل .',
            titleTextStyle: GoogleFonts.cairo(),
            descTextStyle: GoogleFonts.cairo(),
            btnOkOnPress: () {},
          )
          ..show();
        break;
      default:
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'خطأ',
            desc: errorMassege,
            titleTextStyle: GoogleFonts.cairo(),
            descTextStyle: GoogleFonts.cairo(),
            btnOkOnPress: () {},
          )
          ..show();
    }
  }
}
