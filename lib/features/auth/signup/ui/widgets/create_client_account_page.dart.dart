import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/show_dialog_error_handler.dart';
import 'package:meneani/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdropdown.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateClientAccountPage extends StatelessWidget {
  CreateClientAccountPage({super.key});
  bool _isLoading = false;
  void show(BuildContext context, String errorMasseg) async {
    await AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Server Error',
        desc: errorMasseg,
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      )
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg3.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person,
                            size: 300.r,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        CustomText(
                          "إنشاء حساب",
                          style: GoogleFonts.cairo(
                            fontSize: 60.sp,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        CustomTextField(
                          controler: context.read<CreateAccountBloc>().fName,
                          textHint: "الاسم",
                          icon: Icon(Icons.person),
                        ),
                        CustomTextField(
                          textHint: "اللقب",
                          controler: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).lName,
                          icon: Icon(Icons.person),
                        ),
                        CustomTextField(
                          keyBoardType: TextInputType.emailAddress,
                          textHint: "البريد الإلكتروني",
                          controler: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).email,
                          icon: Icon(Icons.email),
                        ),
                        CustomTextField(
                          keyBoardType: TextInputType.phone,
                          textHint: "رقم الهاتف",
                          controler: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).phone,
                          icon: Icon(Icons.phone),
                        ),
                        CustomTextField(
                          keyBoardType: TextInputType.text,
                          textHint: "كلمة السر",
                          controler: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).password,
                          icon: Icon(Icons.lock),
                        ),
                        CustomTextField(
                          keyBoardType: TextInputType.number,
                          textHint: "رقم بطاقة التعريف الوطنية",
                          controler: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).nationalId,
                          icon: Icon(Icons.person),
                        ),

                        CustomDatePicker(
                          controller: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).age,
                          textHint: "تاريخ الميلاد",
                        ),
                        SizedBox(height: 30.h),
                        CustomDropDownMenu(
                          controller: BlocProvider.of<CreateAccountBloc>(
                            context,
                          ).gender,
                        ),
                        SizedBox(height: 30.h),
                        OutlinedButton(
                          onPressed: () {
                            // AwesomeDialog(
                            //   context: context,
                            //   dialogType: DialogType.error,
                            //   animType: AnimType.rightSlide,
                            //   title: 'Server Error',
                            //   desc: "error masseg",
                            //   btnCancelOnPress: () {},
                            //   btnOkOnPress: () {},
                            // )..show();
                            BlocProvider.of<CreateAccountBloc>(
                              context,
                            ).add(CreateClientAccountEvent());
                          },

                          child: CustomText(
                            "إنشاء حساب",
                            style: GoogleFonts.cairo(
                              color: AppColors.secendaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<CreateAccountBloc, CreateAccountState>(
            builder: (context, state) {
              if (state is CreateAccountLoadingState) {
                _isLoading = true;
              } else if (state is CreateAccountLoadedState) {
                _isLoading = false;
              } else if (state is CreateAccountErrorState) {
                _isLoading = false;
                //show(context, state.errorMessage);
                ShowDialogErrorHandler.showErrorDialog(
                  context,
                  state.errorMessage,
                );
              }

              return ModalProgressHUD(
                inAsyncCall: _isLoading,
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
