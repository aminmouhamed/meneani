import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/features/client_profile/ui/bloc/profile_bloc.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        selectedItemColor: AppColors.therdColor,
        selectedLabelStyle: GoogleFonts.cairo(),
        unselectedLabelStyle: GoogleFonts.cairo(),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(
                context,
              ).pushReplacementNamed(AppRoutes.clientProfile);
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed(AppRoutes.clientHome);
              break;
            case 2:
              Navigator.of(context).pushReplacementNamed(AppRoutes.setting);
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "الملف الشخصي",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "الإعدادات",
          ),
        ],
      ),
      appBar: AppBar(
        title: Center(
          child: CustomText(
            "الملف الشخصي",
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              //width: double.infinity,
              //height: double.infinity,
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    width: double.infinity,
                    height: 900.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/pr1.jpg"),
                      ),
                    ),
                    child: SizedBox(),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60.h),
                  Column(
                    children: [
                      Container(
                        height: 400.r,
                        width: 400.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/pr1.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          String name = "";
                          if (state is ProfileErrorState) {}
                          if (state is ProfileLoadedState) {
                            name =
                                "${state.clientEntiti.fName} ${state.clientEntiti.lName}";
                          }
                          if (state is ProfileLoadingState) {}
                          return CustomText(
                            name,
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 45.sp,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 60.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 30.r,
                          vertical: 30.r,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            ProfileTextField(
                              hintText: "تغيير الاسم",
                              icon: Icons.person,
                            ),
                            SizedBox(height: 30.h),
                            ProfileTextField(
                              hintText: "تغيير اللقب",
                              icon: Icons.person,
                            ),
                            SizedBox(height: 30.h),
                            ProfileTextField(
                              hintText: "تغيير البريد الإلكتروني",
                              icon: Icons.person,
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  ProfileTextField({super.key, required this.hintText, required this.icon});
  final String hintText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: Icon(icon),
        hint: CustomText(hintText, style: GoogleFonts.cairo()),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secendaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
