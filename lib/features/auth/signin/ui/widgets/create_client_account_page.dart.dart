import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/features/auth/signin/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/customdropdown.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/textfield.dart';

class CreateClientAccountPage extends StatelessWidget {
  const CreateClientAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: SafeArea(
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
                    child: Icon(Icons.person, size: 300.r, color: Colors.white),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Client Account",
                    style: TextStyle(fontSize: 60.sp, color: Colors.black54),
                  ),
                  SizedBox(height: 40.h),
                  CustomTextField(
                    controler: context.read<CreateAccountBloc>().fName,
                    textHint: "first Name",
                    icon: Icon(Icons.person),
                  ),
                  CustomTextField(
                    textHint: "last Name",
                    controler: BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).lName,
                    icon: Icon(Icons.person),
                  ),
                  CustomTextField(
                    keyBoardType: TextInputType.emailAddress,
                    textHint: "Email",
                    controler: BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).email,
                    icon: Icon(Icons.email),
                  ),
                  CustomTextField(
                    keyBoardType: TextInputType.phone,
                    textHint: "Phone",
                    controler: BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).phone,
                    icon: Icon(Icons.phone),
                  ),
                  CustomTextField(
                    keyBoardType: TextInputType.text,
                    textHint: "password",
                    controler: BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).password,
                    icon: Icon(Icons.lock),
                  ),
                  CustomTextField(
                    keyBoardType: TextInputType.number,
                    textHint: "NationalId",
                    controler: BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).nationalId,
                    icon: Icon(Icons.person),
                  ),

                  CustomDatePicker(
                    controller: BlocProvider.of<CreateAccountBloc>(context).age,
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
                      showAdaptiveDialog(
                        context: context,
                        builder: (_) {
                          return Container(color: Colors.red);
                        },
                      );
                      // BlocProvider.of<CreateAccountBloc>(
                      //   context,
                      // ).add(CreateClientAccountEvent());
                    },
                    child: Text("Create Account"),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
