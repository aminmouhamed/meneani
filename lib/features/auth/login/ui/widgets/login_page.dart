import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/features/auth/login/ui/bloc/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
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
                        hint: "Email",
                        icon: Icons.email,
                        controller: BlocProvider.of<LoginBloc>(context).email,
                      ),
                      SizedBox(height: 30.h),
                      CustomTextForm(
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
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
  });
  final String hint;
  final IconData icon;
  final TextEditingController controller;

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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
