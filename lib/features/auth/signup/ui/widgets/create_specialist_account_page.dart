import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdropdown.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:meneani/features/connectivity/bloc/connectivity_bloc.dart';

class CreateSpecialistAccountPage extends StatelessWidget {
  CreateSpecialistAccountPage({super.key});
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
          } else if (state is CreateAccountState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'نجاح',
              desc: "لقد تم إنشاء الحساب بنجاح .",
              titleTextStyle: GoogleFonts.cairo(),
              descTextStyle: GoogleFonts.cairo(),
              btnCancelOnPress: () {
                Navigator.pop(context);
              },
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            )..show();
          } else if (state is CreateAccountErrorState) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: '',
              desc: state.errorMessage,
              titleTextStyle: GoogleFonts.cairo(),
              descTextStyle: GoogleFonts.cairo(),
              btnCancelOnPress: () {
                Navigator.pop(context);
              },
              btnOkOnPress: () {
                Navigator.pop(context);
              },
            )..show();
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                    height: 400.r,
                    width: 400.r,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),
                      ),
                    ),
                  ),
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
                                    icon: Icon(Icons.person),
                                  ),
                                  CustomTextField(
                                    textHint: "اللقب",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).lName,
                                    icon: Icon(Icons.person),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.emailAddress,
                                    textHint: "البريد الإلكتروني",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).email,
                                    icon: Icon(Icons.email),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.phone,
                                    textHint: "رقم الهاتف",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).phone,
                                    icon: Icon(Icons.phone),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.text,
                                    textHint: "كلمة السر",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).password,
                                    icon: Icon(Icons.lock),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.number,
                                    textHint: "رقم بطاقة التعريف الوطنية",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).nationalId,
                                    icon: Icon(Icons.person),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.number,
                                    textHint: "رقم شهادة التخرج",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).deplomatId,
                                    icon: Icon(Icons.badge),
                                  ),
                                  CustomTextField(
                                    keyBoardType: TextInputType.text,
                                    textHint: "عنوان",
                                    controler:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).address,
                                    icon: Icon(Icons.home),
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
                                  SizedBox(height: 15.h),
                                  CustomDropDownMenu2(
                                    controller:
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).specialistType,
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
                                      ).add(CreateSpecialistAccountEvent());
                                    },
                                    child: CustomText(
                                      "إنشاء حساب",
                                      style: GoogleFonts.cairo(
                                        color: AppColors.therdColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
    );
  }
}
