import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
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
                    CustomTextForm(hint: "Email", icon: Icons.email),
                    SizedBox(height: 30.h),
                    CustomTextForm(hint: "Password", icon: Icons.lock),
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
                    ElevatedButton(onPressed: () {}, child: Text("logIn")),
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
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({super.key, required this.hint, required this.icon});
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        //  controller: controler,
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
