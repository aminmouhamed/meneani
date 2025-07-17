import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/features/auth/login/ui/widgets/login_page.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:meneani/features/client_services/ui/client_ap_service_page.dart';
import 'package:meneani/features/specialist_services/ui/widgets/widgets/custom_chart.dart';

class AppointmentServiceSettingsPage extends StatelessWidget {
  AppointmentServiceSettingsPage({super.key});
  UserPublicData userData = UserPublicData.instence;
  TextEditingController price = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "إعدادات حجز المواعيد.",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.cairo(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              "قم بحجز موعد لزياره الطبيب",
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
                              image: NetworkImage(userData.userImage),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 30.h),
                CustomText("الإعدادات :", style: GoogleFonts.cairo()),
                SizedBox(height: 30.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.r,
                    vertical: 5.r,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSwitsh(),
                      CustomText(
                        "تفعيل الخدمة :",
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                CustomTextField(
                  textHint: "السعر",
                  icon: Icon(Icons.price_change),
                  controler: price,
                ),
                SizedBox(height: 30.h),
                CustomText("الإحصائيات :", style: GoogleFonts.cairo()),
                SizedBox(height: 30.h),
                Container(
                  child: BarChartSample3(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
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

class CustomSwitsh extends StatefulWidget {
  const CustomSwitsh({super.key});

  @override
  State<CustomSwitsh> createState() => _CustomSwitshState();
}

class _CustomSwitshState extends State<CustomSwitsh> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: this.value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}
