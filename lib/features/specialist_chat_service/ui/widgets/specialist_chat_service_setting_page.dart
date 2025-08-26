import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/features/auth/signup/ui/widgets/widgets/textfield.dart';
import 'package:naji/features/connectivity/ui/404.dart';
import 'package:naji/features/specialist_chat_service/ui/bloc/specialist_chat_service_bloc.dart';
import 'package:naji/features/specialist_services/ui/widgets/appointment_service_page.dart';
import 'package:naji/features/specialist_services/ui/widgets/widgets/custom_chart.dart';
import 'package:naji/features/specialist_services/ui/widgets/widgets/value_checker.dart';

class SpecialistChatServiceSettingPage extends StatelessWidget {
  SpecialistChatServiceSettingPage({super.key});
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                        SizedBox(width: 30.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "إعدادات استشارة الطبيب .",
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
        child: InternetConnectionsCheker(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocListener<
                        SpecialistChatServiceBloc,
                        SpecialistChatServiceState
                      >(
                        listener: (context, state) {
                          if (state is SpecialistChatServiceLoadingState) {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              );
                            });
                          }
                          if (state is SpecialistChatServiceLoadedState) {
                            setState(() {
                              Navigator.pop(context);

                              _appointmentSetting.serviceState =
                                  state.serviceSettingEntiti.state;
                              BlocProvider.of<SpecialistChatServiceBloc>(
                                context,
                              ).price.text = state.serviceSettingEntiti.price;
                            });
                          }
                          if (state is SpecialistChatServiceErrorState) {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Container(),
                      ),
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
                                    CustomText(
                                      "تفعيل الخدمة :",
                                      style: GoogleFonts.cairo(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Switch(
                                      value: _appointmentSetting.serviceState,
                                      onChanged: (value) {
                                        setState(() {
                                          _appointmentSetting.serviceState =
                                              value;
                                        });
                                      },
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
                                          BlocProvider.of<
                                                SpecialistChatServiceBloc
                                              >(context)
                                              .price,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<SpecialistChatServiceBloc>(
                                context,
                              ).add(
                                SpecialistChatServiceSetSettingEvent(
                                  state: _appointmentSetting.serviceState,
                                  price:
                                      BlocProvider.of<
                                            SpecialistChatServiceBloc
                                          >(context)
                                          .price
                                          .text,
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
      ),
    );
  }
}
