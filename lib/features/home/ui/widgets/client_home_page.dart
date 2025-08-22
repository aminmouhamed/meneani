import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:meneani/features/connectivity/ui/404.dart';

import 'package:meneani/features/home/data/services/home_service.dart';
import 'package:meneani/features/home/ui/bloc/bloc/home_bloc.dart';
import 'package:meneani/features/home/ui/bloc/home_service_bloc.dart';
import 'package:meneani/features/home/ui/widgets/widgets/custom_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class ClientHomePage extends StatelessWidget {
  ClientHomePage({super.key});
  final String _pageName = AppRoutes.clientHome;
  final HomeService _homeService = HomeService();
  UserPublicData userData = UserPublicData.instence;
  bool _isLoading = false;
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
              if (_pageName != AppRoutes.clientHome) {
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRoutes.clientHome);
              }

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
        automaticallyImplyLeading: false,
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
                          Row(
                            children: [
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
                              SizedBox(width: 30.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "صباح الخير ، ${userData.userfName}.",
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
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.ChatRooms);
                            },
                            icon: Icon(Icons.notifications, size: 90.r),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return SafeArea(
              child: BlocListener<HomeBloc, HomeState>(
                listener: (context, state) {
                  if (state is HomeLoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is HomeLoadedState) {
                    Navigator.pop(context);
                  }
                  if (state is HomeErrorState) {
                    print(state.errorMassege);
                    Navigator.pop(context);
                  }
                },
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    "احرص على صحتك جيدا",
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
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: InternetConnectionsCheker(
          child: Padding(
            padding: EdgeInsets.all(40.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CustomCard(
                      onPress: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.chatServiceHome);
                      },
                      bodyText:
                          "يمكنك استشارة الطبيب عبر الإنترنت ابتداءا من مبلغ 1000دج",
                      titel: "استشارة الطبيب عبر الإنترنت",
                      bgColor: AppColors.therdColor.withAlpha(150),
                      buttonText: "",
                    ),
                    SizedBox(width: 30.h),
                    CustomCard(
                      onPress: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.clientService);
                      },
                      bodyText:
                          "يمكنك حجز موعد مع الطبيب ابتداءا من مبلغ 1000دج",
                      titel: "قم بحجز موعد لزياره الطبيب",
                      bgColor: AppColors.secendaryColor.withAlpha(150),
                      buttonText: "",
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomCard2(
                  onPress: () {
                    BlocProvider.of<ConnectivityBloc>(context);
                  },

                  titel: "التوجيه الأوتوماتيكي",
                  bgColor: AppColors.primeryColor.withAlpha(150),
                  buttonText: "",
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "مواعيدي :",
                      style: GoogleFonts.cairo(fontSize: 47.sp),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeServiceBloc>(
                          context,
                        ).add(HomeGetClientAppointmentEvent());
                      },
                      icon: Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                Expanded(
                  child: BlocBuilder<HomeServiceBloc, HomeServiceState>(
                    builder: (context, state) {
                      bool _isLoging = false;
                      if (state is HomeAppointmrntLoadedState) {
                        return ModalProgressHUD(
                          inAsyncCall: _isLoging,
                          child: ListView.builder(
                            itemCount: state.appointmentList!.length,
                            itemBuilder: (context, index) {
                              return FittedBox(
                                child: Container(
                                  margin: EdgeInsets.only(top: 30.h),
                                  padding: EdgeInsets.only(
                                    left: 30.w,
                                    right: 30.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: 200.r,
                                        width: 200.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                state
                                                    .appointmentList![index]
                                                    .specialistImage
                                                    .isEmpty
                                                ? AssetImage(
                                                    "assets/images/pr1.jpg",
                                                  )
                                                : NetworkImage(
                                                    state
                                                        .appointmentList![index]
                                                        .specialistImage,
                                                  ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            "${state.appointmentList![index].specialistFName} ${state.appointmentList![index].specialisLName}",
                                            style: GoogleFonts.cairo(),
                                          ),
                                          SizedBox(height: 10.h),
                                          CustomText(
                                            state
                                                .appointmentList![index]
                                                .specialistType,
                                            style: GoogleFonts.cairo(),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          CustomText(
                                            state
                                                .appointmentList![index]
                                                .appointmentDate
                                                .split("T")[0],
                                            style: GoogleFonts.cairo(),
                                          ),
                                          CustomText(
                                            DateTime.parse(
                                                  state
                                                      .appointmentList![index]
                                                      .appointmentDate,
                                                ).hour.toString() +
                                                ":" +
                                                DateTime.parse(
                                                  state
                                                      .appointmentList![index]
                                                      .appointmentDate,
                                                ).minute.toString().padLeft(
                                                  2,
                                                  "0",
                                                ),
                                            style: GoogleFonts.cairo(),
                                          ),
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) => Center(
                                                  child: Container(
                                                    height: 500.h,
                                                    width: double.infinity,
                                                    padding: EdgeInsets.all(
                                                      30.r,
                                                    ),
                                                    margin: EdgeInsets.all(
                                                      30.r,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.location_on,
                                                          size: 150.r,
                                                          color:
                                                              Colors.blue[200],
                                                        ),
                                                        SizedBox(height: 30.h),
                                                        CustomText(
                                                          state
                                                              .appointmentList![index]
                                                              .specialistAddress,
                                                          style:
                                                              GoogleFonts.cairo(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 60.sp,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.location_on,
                                              color: Colors.blue[200],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              BlocProvider.of<HomeServiceBloc>(
                                                context,
                                              ).add(
                                                DeleteClientAppointmentEvent(
                                                  id: state
                                                      .appointmentList![index]
                                                      .id,
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red[200],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if (state is HomeClientAppointmentLoadingState) {
                        _isLoging = true;
                      }
                      return ModalProgressHUD(
                        color: Colors.white,
                        opacity: 0.1,
                        inAsyncCall: _isLoging,
                        child: Container(),
                      );
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
