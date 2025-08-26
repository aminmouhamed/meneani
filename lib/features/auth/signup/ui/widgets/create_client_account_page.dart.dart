import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/core/widgets/show_dialog_error_handler.dart';
import 'package:naji/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:naji/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:naji/features/auth/signup/ui/widgets/widgets/customdropdown.dart';
import 'package:naji/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:naji/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateClientAccountPage extends StatelessWidget {
  CreateClientAccountPage({super.key});
  bool _isLoading = false;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
      body: BlocListener<CreateAccountBloc, CreateAccountState>(
        listener: (context, state) {
          if (state is CreateAccountLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          }
          if (state is CreateAccountLoadedState) {
            Navigator.pop(context);
          }
          if (state is CreateAccountErrorState) {
            Navigator.pop(context);
            //show(context, state.errorMessage);
            ShowDialogErrorHandler.showErrorDialog(context, state.errorMessage);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    Container(
                      //padding: EdgeInsets.all(10.r),
                      height: 400.r,
                      width: 400.r,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Stack(
                      children: [
                        Form(
                          key: _globalKey,
                          child: Column(
                            children: [
                              SizedBox(height: 65.h),
                              Container(
                                padding: EdgeInsets.all(30.r),
                                decoration: BoxDecoration(
                                  //border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.therdColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    SizedBox(height: 70.h),

                                    CustomTextField(
                                      controler: context
                                          .read<CreateAccountBloc>()
                                          .fName,
                                      textHint: "الاسم",
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    CustomTextField(
                                      textHint: "اللقب",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).lName,
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    CustomTextField(
                                      keyBoardType: TextInputType.emailAddress,
                                      textHint: "البريد الإلكتروني",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).email,
                                      icon: Icon(
                                        Icons.email,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    CustomTextField(
                                      keyBoardType: TextInputType.phone,
                                      textHint: "رقم الهاتف",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).phone,
                                      icon: Icon(
                                        Icons.phone,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    CustomTextField(
                                      keyBoardType: TextInputType.text,
                                      textHint: "كلمة السر",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).password,
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    CustomTextField(
                                      keyBoardType: TextInputType.number,
                                      textHint: "رقم بطاقة التعريف الوطنية",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).nationalId,
                                      icon: Icon(
                                        Icons.person,
                                        color: Colors.black54,
                                      ),
                                    ),

                                    CustomDatePicker(
                                      controller:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).age,
                                      textHint: "تاريخ الميلاد",
                                    ),
                                    SizedBox(height: 15.h),
                                    CustomDropDownMenu(
                                      controller:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).gender,
                                    ),
                                    SizedBox(height: 30.h),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (BlocProvider.of<ConnectivityBloc>(
                                              context,
                                            ).state
                                            is ConnectivityDontHaveConnectionsState) {
                                          AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.rightSlide,
                                            title: 'تحذير',
                                            desc: "تحقق من اتصالك بالإنترنت .",
                                            titleTextStyle: GoogleFonts.cairo(),
                                            descTextStyle: GoogleFonts.cairo(),

                                            btnOkOnPress: () {},
                                          )..show();
                                        }
                                        if (!_globalKey.currentState!
                                            .validate()) {
                                          return;
                                        }
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).add(CreateClientAccountEvent());
                                      },

                                      child: CustomText(
                                        "إنشاء حساب",
                                        style: GoogleFonts.cairo(
                                          color: AppColors.therdColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    //SizedBox(height: 30.h),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(20.r),
                            decoration: BoxDecoration(
                              color: AppColors.therdColor,
                              border: Border.all(width: 2, color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CustomText(
                              "إنشاء حساب",
                              style: GoogleFonts.cairo(
                                fontSize: 60.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
