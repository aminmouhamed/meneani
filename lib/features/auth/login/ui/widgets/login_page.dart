import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/routing/app_routes.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/core/widgets/show_dialog_error_handler.dart';
import 'package:naji/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:naji/features/connectivity/bloc/connectivity_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  Color emailBorderColor = Colors.black;
  Color passwordBorderColor = Colors.black;
  UserPublicData _userData = UserPublicData.instence;
  void goToHome(context) async {
    await Future.delayed(Duration(seconds: 1));
    if (_userData.UserType == "client") {
      await Navigator.of(context).pushReplacementNamed(AppRoutes.clientHome);
    } else if (_userData.UserType == "specialist") {
      await Navigator.of(
        context,
      ).pushReplacementNamed(AppRoutes.specialistHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LogInLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is LogInLoadedState) {
            Navigator.pop(context);
            goToHome(context);
          } else if (state is LogInErrorState) {
            Navigator.pop(context);
            emailBorderColor = Colors.red;
            passwordBorderColor = Colors.red;
            //show(context, state.errorMessage);
            ShowDialogErrorHandler.showErrorDialog(context, state.errorMessage);
          }
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/bg3.png"),
            //   fit: BoxFit.cover,
            // ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100.h),
                  Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      color: AppColors.therdColor.withAlpha(100),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.therdColor, width: 2),
                    ),
                    child: Container(
                      width: 500.r,
                      height: 500.r,
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  CustomText(
                    "تسجيل دخول",
                    style: GoogleFonts.cairo(
                      fontSize: 80.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextForm(
                          BorderColor: emailBorderColor,
                          hint: "البريد الإلكتروني",
                          icon: Icons.email,
                          controller: BlocProvider.of<LoginBloc>(context).email,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 30.h),
                        CustomTextForm(
                          password: true,
                          BorderColor: passwordBorderColor,
                          hint: "كلمة السر",
                          icon: Icons.lock,
                          controller: BlocProvider.of<LoginBloc>(
                            context,
                          ).password,
                          keyBoardType: TextInputType.text,
                        ),
                        SizedBox(height: 10.h),
                        RichText(
                          text: TextSpan(
                            text: "إذا لم يكن لديك حساب , ",
                            style: GoogleFonts.cairo(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: "إنشاء حساب مريض",
                                style: GoogleFonts.cairo(
                                  color: AppColors.secendaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(
                                    context,
                                  ).pushNamed(AppRoutes.createClientAccount),
                              ),
                              TextSpan(
                                text: " أو ",
                                style: GoogleFonts.cairo(),
                              ),
                              TextSpan(
                                text: "إنشاء حساب مختص .",
                                style: GoogleFonts.cairo(
                                  color: AppColors.secendaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.createSpecialistAccount,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.primeryColor,
                            ),
                          ),
                          onPressed: () {
                            if (BlocProvider.of<ConnectivityBloc>(context).state
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
                              return;
                            }
                            BlocProvider.of<LoginBloc>(
                              context,
                            ).add(LogInWithEmailAndPasswordEvent());
                          },
                          child: CustomText(
                            "تسجيل دخول",
                            style: GoogleFonts.cairo(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
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

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.BorderColor = Colors.black87,
    this.password = false,
    required this.keyBoardType,
  });
  bool password;
  bool hide = true;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  Color BorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StatefulBuilder(
        builder: (context, setState) {
          return TextFormField(
            keyboardType: this.keyBoardType,
            controller: controller,
            obscureText: password ? hide : false,
            // keyboardType: keyBoardType,
            onTap: () async {},
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: true,
              suffixIcon: password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          if (hide) {
                            hide = false;
                          } else {
                            hide = true;
                          }
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                      ),
                    )
                  : Icon(icon, color: Colors.black54),
              hint: CustomText(
                hint,
                style: GoogleFonts.cairo(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: BorderColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
