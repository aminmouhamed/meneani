import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/widgets/custom_text.dart';

import 'package:meneani/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:meneani/features/specialist_services/ui/bloc/specialist_services_bloc.dart';

import 'package:meneani/features/specialist_services/ui/widgets/widgets/custom_chart.dart';
import 'package:meneani/features/specialist_services/ui/widgets/widgets/value_checker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AppointmentServiceSettingsPage extends StatelessWidget {
  AppointmentServiceSettingsPage({super.key});
  UserPublicData _userData = UserPublicData.instence;
  AppointmentSetting _appointmentSetting = AppointmentSetting();
  bool _isloading = true;

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
                              image: _userData.userImage.isEmpty
                                  ? AssetImage("assets/images/profil_img.jpg")
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
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.r),
            child: BlocBuilder<SpecialistServicesBloc, SpecialistServicesState>(
              builder: (context, state) {
                if (state is SpecialistAppointmentServiceLoadingState) {
                  _isloading = true;
                }
                if (state is SpecialistAppointmentServiceLoadedState) {
                  _isloading = false;

                  _appointmentSetting.serviceState =
                      state.appointmentEntiti.service_state;
                  print(
                    "service state : ${state.appointmentEntiti.service_state}",
                  );
                }
                if (state is SpecialistServiceErrorState) {
                  _isloading = false;
                  print(state.errorMessage);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 30.h),
                    CustomText("الإعدادات :", style: GoogleFonts.cairo()),
                    SizedBox(height: 30.h),
                    StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return Column(
                          children: [
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Switch(
                                    value: _appointmentSetting.serviceState,
                                    onChanged: (value) {
                                      setState(() {
                                        _appointmentSetting.serviceState =
                                            value;
                                      });
                                    },
                                  ),
                                  CustomText(
                                    "تفعيل الخدمة :",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ValueChek(
                              child: Column(
                                children: [
                                  SizedBox(height: 30.h),
                                  CustomTextField(
                                    textHint: "السعر",
                                    icon: Icon(Icons.price_change),
                                    controler:
                                        BlocProvider.of<SpecialistServicesBloc>(
                                          context,
                                        ).price,
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                              ),
                              value: _appointmentSetting.serviceState,
                            ),
                          ],
                        );
                      },
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<SpecialistServicesBloc>(
                              context,
                            ).add(
                              SpecialistUpdateAppointmentSettingEvent(
                                serviceState: _appointmentSetting.serviceState,
                                price: BlocProvider.of<SpecialistServicesBloc>(
                                  context,
                                ).price.text,
                              ),
                            );
                          },
                          child: CustomText(
                            "تاكيد",
                            style: GoogleFonts.cairo(color: Colors.black),
                          ),
                        ),
                      ],
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentSetting {
  bool serviceState = false;
  String price = "";
}
