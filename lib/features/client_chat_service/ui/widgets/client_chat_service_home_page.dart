import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/di/di.dart' as di;
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/client_appointment_services/ui/widgets/client_ap_service_page.dart';
import 'package:meneani/features/client_chat_service/domain/entiti/specialist_chat_service_entiti.dart';
import 'package:meneani/features/client_chat_service/ui/bloc/client_chat_services_bloc/client_chat_bloc.dart';

class ClientChatServiceHomePage extends StatelessWidget {
  ClientChatServiceHomePage({super.key});
  UserPublicData userData = UserPublicData.instence;
  List<SpecialistChatServiceEntiti> _ap = [];

  List<List<dynamic>> specialistType = [
    ["مختص في الأمراض العقلية", AppColors.primeryColor.withAlpha(100)],
    ["مختص في الإدمان", Colors.white],
    ["مختص في الفيزيوجيا", Colors.white],
    ["مختص نفسي عيادي", Colors.white],
    ["مختص نفس عصبي", Colors.white],
    ["مختص في التغذية", Colors.white],
    ["مختص أرطفوني '(علم الأعصاب اللغوي العيادي)", Colors.white],
  ];
  void clearColor() {
    for (int i = 0; i < this.specialistType.length; i++) {
      this.specialistType[i][1] = Colors.white;
    }
  }

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
                              "استشارة الطبيب .",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.cairo(
                                fontSize: 50.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              textDirection: TextDirection.rtl,
                              "قم باستشارة الطبيب .",
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
                              image: userData.userImage.isEmpty
                                  ? AssetImage("assets/images/pr1.jpg")
                                  : NetworkImage(userData.userImage),
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
      body: BlocListener<ClientChatBloc, ClientChatState>(
        listener: (context, state) {
          if (state is ClientChatServiceLoadingState) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          }
          if (state is ClientChatServiceLoadedState) {
            Navigator.pop(context);
          }
          if (state is ClientChatServiceErrorState) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
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
                  child: StatefulBuilder(
                    builder: (context, setState) => ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: this.specialistType.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              clearColor();
                              this.specialistType[index][1] = AppColors
                                  .primeryColor
                                  .withAlpha(100);
                              _ap = [];
                              BlocProvider.of<ClientChatBloc>(context).add(
                                GetSpecialistChatServicesEvent(
                                  specialistType: this.specialistType[index][0],
                                ),
                              );
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 30.r),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.h,
                              vertical: 30.w,
                            ),
                            decoration: BoxDecoration(
                              color: specialistType[index][1],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: CustomText(
                              specialistType[index][0],
                              style: GoogleFonts.cairo(fontSize: 35.sp),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Text(": المختصين", style: GoogleFonts.cairo(fontSize: 47.sp)),

                SizedBox(height: 30.h),
                Expanded(
                  child: BlocBuilder<ClientChatBloc, ClientChatState>(
                    builder: (context, state) {
                      if (state is ClientChatServiceLoadedState) {
                        _ap = state.chatService;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _ap.length,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              CustomText(
                                                "${_ap[index].fName} ${_ap[index].lName}",
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
                                                _ap[index].specialistType,
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
                                      Hero(
                                        tag: _ap[index].image,
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: _ap[index].image.isEmpty
                                                  ? AssetImage(
                                                      "assets/images/pr1.jpg",
                                                    )
                                                  : NetworkImage(
                                                      _ap[index].image,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 50.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.amberAccent,
                                          ),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                        ],
                                      ),
                                      SimpelButton(
                                        text: "حجز موعد",
                                        onPress: () {
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(
                                          //     builder: (context) => BlocProvider(
                                          //       create: (context) => ClientServiceBloc(
                                          //         setClientAppointmentUsecase:
                                          //             di.getIT(),
                                          //         getSpecialistEppointmentServices:
                                          //             di.getIT(),
                                          //         getAppointmentOfServiceUsecase:
                                          //             di.getIT(),
                                          //       ),
                                          //       child: AppointmentServicePage(
                                          //         appointmentEntiti: _ap[index],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
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
