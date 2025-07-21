import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/client_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_services/ui/widgets/client_ap_service_page.dart';

class AppointmentServicePage extends StatelessWidget {
  AppointmentServicePage({super.key, required this.appointmentEntiti});
  final AppointmentEntiti appointmentEntiti;
  UserPublicData userData = UserPublicData.instence;
  final TextEditingController date = TextEditingController();
  List<List<dynamic>> times = [
    ["08:30", Colors.red[200]],
    ["09:00", Colors.black12],
    ["09:30", Colors.black12],
    ["10:00", Colors.black12],
    ["10:30", Colors.black12],
    ["11:00", Colors.black12],
    ["11:30", Colors.black12],
    ["12:00", Colors.black12],
    ["12:30", Colors.black12],
    ["13:00", Colors.black12],
    ["13:30", Colors.black12],
    ["14:00", Colors.black12],
    ["14:30", Colors.black12],
    ["15:00", Colors.black12],
    ["15:30", Colors.black12],
    ["16:00", Colors.black12],
    ["16:30", Colors.black12],
    ["17:30", Colors.black12],
    ["18:00", Colors.black12],
    ["18:30", Colors.black12],
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 30.h),
                CustomText(
                  "معلومات المختص :",
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.red,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                  "${appointmentEntiti.fName} ${appointmentEntiti.lName}",
                                  style: GoogleFonts.cairo(fontSize: 40.sp),
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
                                  appointmentEntiti.specialistType,
                                  style: GoogleFonts.cairo(fontSize: 40.sp),
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
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 550.w,
                                  child: CustomText(
                                    appointmentEntiti.address,
                                    style: GoogleFonts.cairo(fontSize: 40.sp),
                                  ),
                                ),

                                CustomText(
                                  "العنوان : ",
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Container(
                        width: 400.r,
                        height: 400.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(appointmentEntiti.image),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                CustomText(
                  "السعر :",
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30.r),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomText(
                    "السعر : ${appointmentEntiti.prix}دج",
                    maxLines: 6,
                    style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30.h),
                CustomText(
                  "الوصف :",
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                Container(
                  padding: EdgeInsets.all(30.r),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomText(
                    appointmentEntiti.descriptions,
                    maxLines: 6,
                    style: GoogleFonts.cairo(),
                  ),
                ),
                SizedBox(height: 30.h),
                CustomText(
                  "حجز موعد :",
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30.h),
                Container(
                  padding: EdgeInsets.all(40.r),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        "التاريخ : 22/07/2025",
                        style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30.h),
                      GridView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: times.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: 40,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20.r),
                            margin: EdgeInsets.all(8.r),
                            child: CustomText(times[index][0]),
                            decoration: BoxDecoration(
                              color: times[index][1],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        },
                      ),
                    ],
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
