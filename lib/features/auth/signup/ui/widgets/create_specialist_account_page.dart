import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meneani/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdropdown.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/textfield.dart';

class CreateSpecialistAccountPage extends StatelessWidget {
  const CreateSpecialistAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, size: 100, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Specialist Account",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                SizedBox(height: 15),
                CustomTextField(
                  controler: context.read<CreateAccountBloc>().fName,
                  textHint: "الاسم",
                  icon: Icon(Icons.person),
                ),
                CustomTextField(
                  textHint: "اللقب",
                  controler: BlocProvider.of<CreateAccountBloc>(context).lName,
                  icon: Icon(Icons.person),
                ),
                CustomTextField(
                  keyBoardType: TextInputType.emailAddress,
                  textHint: "البريد الإلكتروني",
                  controler: BlocProvider.of<CreateAccountBloc>(context).email,
                  icon: Icon(Icons.email),
                ),
                CustomTextField(
                  keyBoardType: TextInputType.phone,
                  textHint: "رقم الهاتف",
                  controler: BlocProvider.of<CreateAccountBloc>(context).phone,
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
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  textHint: "رقم شهادة التخرج",
                  controler: BlocProvider.of<CreateAccountBloc>(
                    context,
                  ).nationalId,
                  icon: Icon(Icons.badge),
                ),
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  textHint: "عنوان",
                  controler: BlocProvider.of<CreateAccountBloc>(
                    context,
                  ).nationalId,
                  icon: Icon(Icons.home),
                ),
                CustomDatePicker(
                  controller: BlocProvider.of<CreateAccountBloc>(context).age,
                  textHint: "تاريخ الميلاد",
                ),
                SizedBox(height: 10),
                CustomDropDownMenu(
                  controller: BlocProvider.of<CreateAccountBloc>(
                    context,
                  ).gender,
                ),
                SizedBox(height: 10),
                CustomDropDownMenu2(
                  controller: BlocProvider.of<CreateAccountBloc>(
                    context,
                  ).specialistType,
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {
                    BlocProvider.of<CreateAccountBloc>(
                      context,
                    ).add(CreateSpecialistAccountEvent());
                  },
                  child: Text("Create Account"),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
