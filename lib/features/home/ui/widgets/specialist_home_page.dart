import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/features/home/ui/bloc/bloc/home_bloc.dart';
import 'package:meneani/features/home/ui/widgets/client_home_page.dart';
import 'package:meneani/features/home/ui/widgets/widgets/custom_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SpecialistHomePage extends StatelessWidget {
  SpecialistHomePage({super.key});
  UserPublicData _userData = UserPublicData.instence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 1,
        selectedItemColor: AppColors.therdColor,
        selectedLabelStyle: GoogleFonts.cairo(),
        unselectedLabelStyle: GoogleFonts.cairo(),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              break;
            case 1:
              Navigator.of(
                context,
              ).pushReplacementNamed(AppRoutes.specialistHome);
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
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NotificationsIconButton(),

                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "صباح الخير ، ${_userData.userfName}.",
                                    textDirection: TextDirection.rtl,
                                    style: GoogleFonts.cairo(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    "حساب المختص",
                                    style: GoogleFonts.cairo(fontSize: 35.sp),
                                  ),
                                ],
                              ),
                              SizedBox(width: 30.w),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _userData.userImage.isEmpty
                                        ? AssetImage(
                                            "assets/images/profil_img.jpg",
                                          )
                                        : NetworkImage(_userData.userImage),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.h),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NotificationsIconButton(),

                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "صباح الخير ، .",
                                  textDirection: TextDirection.rtl,
                                  style: GoogleFonts.cairo(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  textDirection: TextDirection.rtl,
                                  "حساب المختص",
                                  style: GoogleFonts.cairo(fontSize: 35.sp),
                                ),
                              ],
                            ),
                            SizedBox(width: 30.w),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/images/pr1.jpg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(40.r),
          child: Column(
            children: [
              Row(
                children: [
                  CustomCard(
                    onPress: () {},
                    bodyText:
                        "هنا يمكنك التحكم بإعداد الخدمة الخاصة بك و الوصول إلى إحصائياتها .",
                    titel: "استشارة الطبيب عبر الإنترنت",
                    bgColor: AppColors.therdColor.withAlpha(150),
                    buttonText: "",
                  ),
                  SizedBox(width: 30.h),
                  CustomCard(
                    onPress: () {
                      Navigator.of(
                        context,
                      ).pushNamed(AppRoutes.apointmentServiceSetting);
                    },
                    bodyText:
                        "هنا يمكنك التحكم بإعداد الخدمة الخاصة بك و الوصول إلى إحصائياتها .",
                    titel: "الإعدادات الخاصة بخدمة حجز المواعيد",
                    bgColor: AppColors.secendaryColor.withAlpha(150),
                    buttonText: "",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
