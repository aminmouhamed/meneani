import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_services/ui/appointment_service_page.dart';
import 'package:meneani/features/home/ui/widgets/client_home_page.dart';

class ClientAppointmentServicePage extends StatelessWidget {
  ClientAppointmentServicePage({super.key});
  UserPublicData userData = UserPublicData.instence;
  List<String> specialistType = [
    "مختص في الأمراض العقلية",
    "مختص في الإدمان",
    "مختص في الفيزيوجيا",
    "مختص نفسي عيادي",
    "مختص نفس عصبي",
    "مختص في التغذية",
    "مختص أرطفوني '(علم الأعصاب اللغوي العيادي)",
  ];
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearshIconButton(),

                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "حجز موعد .",
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
        child: Padding(
          padding: EdgeInsets.all(40.r),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(": الاختصاصات", style: GoogleFonts.cairo(fontSize: 47.sp)),
              SizedBox(height: 30.h),
              Container(
                width: double.infinity,
                height: 120.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: specialistType.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 30.r),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.h,
                        vertical: 30.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomText(
                        specialistType[index],
                        style: GoogleFonts.cairo(fontSize: 35.sp),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30.h),
              Text(": المختصين", style: GoogleFonts.cairo(fontSize: 47.sp)),

              SizedBox(height: 30.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      padding: EdgeInsets.all(40.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        "جرايمي كريمة",
                                        style: GoogleFonts.cairo(
                                          fontSize: 40.sp,
                                        ),
                                      ),
                                      CustomText(
                                        "اسم الطبيب : ",
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      CustomText(
                                        " مختص في الأمراض العقلية",
                                        style: GoogleFonts.cairo(
                                          fontSize: 40.sp,
                                        ),
                                      ),
                                      CustomText(
                                        "الاختصاص : ",
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40.sp,
                                        ),
                                      ),
                                    ],
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
                          SizedBox(height: 50.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amberAccent),
                                  Icon(Icons.star, color: Colors.amberAccent),
                                  Icon(Icons.star, color: Colors.amberAccent),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              ),
                              SimpelButton(
                                text: "حجز موعد",
                                onPress: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AppointmentServicePage(
                                        appointmentEntiti: AppointmentEntiti(
                                          address: "ميلة ، ميلة ، حي 300 مسكن",
                                          descriptions:
                                              "ضرب مع تكتيكاً الجديدة،, ان جدول سبتمبر اقتصادية تلك, تم الدول الأول اليابان، مما. يونيو بتحدّي ان وتم. وبعض مليون الأبرياء بل به،, الطرفين ومطالبة انتصارهم يكن تم. إتار والحزب ويكيبيديا، لم ومن, قبل المسرح الأوربيين ثم. مايو تار والحزب ويكيبيديا، لم ومن, قبل المسرح الأوربيين ثم. مايو تار والحزب ويكيبيديا، لم ومن, قبل المسرح الأوربيين ثم. مايو تار والحزب ويكيبيديا، لم ومن, قبل المسرح الأوربيين ثم. مايو حتار والحزب ويكيبيديا، ",
                                          fName: "جرايمي",
                                          lName: "كريمة",
                                          image: "assets/images/pr1.jpg",
                                          specialistType:
                                              "ةختص في الأمراض العقلية",
                                          prix: "3000",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
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

class SearshIconButton extends StatefulWidget {
  const SearshIconButton({super.key});

  @override
  State<SearshIconButton> createState() => _SearshIconButtonState();
}

class _SearshIconButtonState extends State<SearshIconButton> {
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
        child: Icon(Icons.search, size: 100.r),
      ),
    );
  }
}
