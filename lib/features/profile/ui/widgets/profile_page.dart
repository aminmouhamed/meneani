import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/routing/app_routes.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/features/connectivity/ui/404.dart';
import 'package:naji/features/profile/data/services/profile_services.dart';
import 'package:naji/features/profile/ui/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  ProfileServices _profileServices = ProfileServices();
  UserPublicData userData = UserPublicData.instence;
  File? _imageFile;
  Future pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    _imageFile = File(image!.path);
  }

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
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed(
                userData.UserType == "client"
                    ? AppRoutes.clientHome
                    : AppRoutes.specialistHome,
              );
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
        child: InternetConnectionsCheker(
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
                          image: userData.userImage.isEmpty
                              ? AssetImage("assets/images/pr1.jpg")
                              : NetworkImage(userData.userImage),
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
                          alignment: Alignment.bottomRight,
                          height: 400.r,
                          width: 400.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: userData.userImage.isEmpty
                                  ? AssetImage("assets/images/pr1.jpg")
                                  : NetworkImage(userData.userImage),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => pickImage(),
                            icon: Icon(Icons.add_a_photo, color: Colors.white),
                          ),
                        ),

                        SizedBox(height: 30.h),
                        CustomText(
                          "${userData.userfName} ${userData.userlName}",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 45.sp,
                            color: Colors.white,
                          ),
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
                              ElevatedButton(
                                onPressed: () async {
                                  BlocProvider.of<ProfileBloc>(context).add(
                                    SetUserImageProfileEvent(
                                      image: _imageFile!,
                                    ),
                                  );
                                },
                                child: Text("uploade"),
                              ),
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
