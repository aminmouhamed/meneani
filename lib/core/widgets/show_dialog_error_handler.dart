import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class ShowDialogErrorHandler {
  static void showErrorDialog(BuildContext context, String errorMassege) async {
    switch (errorMassege) {
      case "Anonymous sign-ins are disabled":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'Please Insert Your informations .',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )
          ..show();
        break;
      case "missing email or phone":
        await AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.rightSlide,
            title: 'Error',
            desc: 'missing email or phone .',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          )
          ..show();
        break;
      default:
        break;
    }
  }
}
