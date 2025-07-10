import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/widgets/show_dialog_error_handler.dart';
import 'package:meneani/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  bool _isLoading = false;
  Color emailBorderColor = AppColors.secendaryColor;
  Color passwordBorderColor = AppColors.secendaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LogInLoadingState) {
            _isLoading = true;
          } else if (state is LogInLoadedState) {
            _isLoading = false;
          } else if (state is LogInErrorState) {
            _isLoading = false;
            emailBorderColor = Colors.red;
            passwordBorderColor = Colors.red;
            //show(context, state.errorMessage);
            ShowDialogErrorHandler.showErrorDialog(context, state.errorMessage);
          }

          return ModalProgressHUD(
            inAsyncCall: _isLoading,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg3.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 500.h),
                      Text("Login", style: TextStyle(fontSize: 80.sp)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextForm(
                              BorderColor: emailBorderColor,
                              hint: "Email",
                              icon: Icons.email,
                              controller: BlocProvider.of<LoginBloc>(
                                context,
                              ).email,
                            ),
                            SizedBox(height: 30.h),
                            CustomTextForm(
                              BorderColor: passwordBorderColor,
                              hint: "Password",
                              icon: Icons.lock,
                              controller: BlocProvider.of<LoginBloc>(
                                context,
                              ).password,
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                Text("If you dont have account "),
                                Text(
                                  "Create Accont .",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                            ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(
                                  context,
                                ).add(LogInWithEmailAndPasswordEvent());
                              },
                              child: Text("logIn"),
                            ),
                            SizedBox(height: 30.h),
                            OutlinedButton(
                              onPressed: () {},
                              child: Text("Create Account"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
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
    this.BorderColor = AppColors.primeryColor,
  });
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  Color BorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        // keyboardType: keyBoardType,
        onTap: () async {},
        decoration: InputDecoration(
          isDense: true,
          prefixIcon: Icon(icon),
          hint: Text(hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: BorderColor),
          ),
        ),
      ),
    );
  }
}
