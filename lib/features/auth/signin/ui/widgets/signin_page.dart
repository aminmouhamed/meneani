import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meneani/features/auth/signin/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/customdropdown.dart';
import 'package:meneani/features/auth/signin/ui/widgets/widgets/textfield.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          //appBar: AppBar(),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRect(
                          child: Center(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                // height: 800,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(
                                    183,
                                    238,
                                    238,
                                    238,
                                  ).withAlpha(100),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    // SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45,
                                            child: Text(
                                              "Client Account",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Colors.black54,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45,
                                            child: Text(
                                              "Specialist Account",
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blueAccent,
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                color: Colors.blueAccent,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(3),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 15),
                                    CustomTextField(
                                      controler: context
                                          .read<CreateAccountBloc>()
                                          .fName,
                                      textHint: "first Name",
                                      icon: Icon(Icons.person),
                                    ),
                                    CustomTextField(
                                      textHint: "last Name",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).lName,
                                      icon: Icon(Icons.person),
                                    ),
                                    CustomTextField(
                                      textHint: "Email",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).email,
                                      icon: Icon(Icons.email),
                                    ),
                                    CustomTextField(
                                      textHint: "Phone",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).phone,
                                      icon: Icon(Icons.phone),
                                    ),
                                    CustomTextField(
                                      textHint: "password",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).password,
                                      icon: Icon(Icons.lock),
                                    ),
                                    CustomTextField(
                                      textHint: "NationalId",
                                      controler:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).nationalId,
                                      icon: Icon(Icons.person),
                                    ),

                                    CustomDatePicker(
                                      controller:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).age,
                                    ),
                                    SizedBox(height: 10),
                                    CustomDropDownMenu(
                                      controller:
                                          BlocProvider.of<CreateAccountBloc>(
                                            context,
                                          ).gender,
                                    ),
                                    SizedBox(height: 10),
                                    OutlinedButton(
                                      onPressed: () {
                                        BlocProvider.of<CreateAccountBloc>(
                                          context,
                                        ).add(CreateClientAccountEvent());
                                      },
                                      child: Text("Create Account"),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
