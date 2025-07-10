import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/home/ui/widgets/widgets/custom_card.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

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
              Navigator.of(
                context,
              ).pushReplacementNamed(AppRoutes.clientProfile);
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed(AppRoutes.clientHome);
              break;
            case 2:
              Navigator.of(
                context,
              ).pushReplacementNamed(AppRoutes.clientProfile);
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
        flexibleSpace: SafeArea(
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
                              "صباح الخير ، محمد.",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.cairo(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              "احرص على صحتك جيدا",
                              style: GoogleFonts.cairo(fontSize: 35.sp),
                            ),
                          ],
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/profil_img.jpg"),
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
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  CustomCard(
                    onPress: () {},
                    titel: "استشارة الطبيب عبر الإنترنت",
                    bgColor: AppColors.therdColor.withAlpha(150),
                    buttonText: "",
                  ),
                  SizedBox(width: 30.h),
                  CustomCard(
                    onPress: () {
                      Navigator.of(context).pushNamed(AppRoutes.clientService);
                    },
                    titel: "قم بحجز موعد لزياره الطبيب",
                    bgColor: AppColors.secendaryColor.withAlpha(150),
                    buttonText: "",
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomCard2(
                onPress: () {},
                titel: "التوجيه الأوتوماتيكي",
                bgColor: AppColors.primeryColor.withAlpha(150),
                buttonText: "",
              ),
              SizedBox(height: 30.h),
              Text(": مواعيدي", style: GoogleFonts.cairo(fontSize: 47.sp)),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.all(30.r),
                decoration: BoxDecoration(color: Colors.white),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Doctor Name : "), Text("Date : ")],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 30.h),
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText("12/12/2025", style: GoogleFonts.cairo()),
                          CustomText(
                            "محمدأمين قطش",
                            style: GoogleFonts.cairo(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsIconButton extends StatefulWidget {
  const NotificationsIconButton({super.key});

  @override
  State<NotificationsIconButton> createState() =>
      _NotificationsIconButtonState();
}

class _NotificationsIconButtonState extends State<NotificationsIconButton> {
  Color color = Colors.black12;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          color = Colors.black12;
        });
      },
      onTapDown: (_) {
        setState(() {
          color = AppColors.secendaryColor;
        });
      },
      child: Container(
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Icon(Icons.notifications, size: 100.r),
      ),
    );
  }
}
