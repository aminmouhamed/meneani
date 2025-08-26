import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/time.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/core/widgets/simpel_button.dart';
import 'package:naji/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:naji/features/client_appointment_services/data/service/client_services_services.dart';
import 'package:naji/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:naji/features/client_appointment_services/ui/bloc/client_service_bloc.dart';
import 'package:naji/features/client_appointment_services/ui/widgets/client_ap_service_page.dart';
import 'package:naji/features/connectivity/ui/404.dart';

class AppointmentServicePage extends StatelessWidget {
  AppointmentServicePage({super.key, required this.appointmentEntiti});
  final AppointmentEntiti appointmentEntiti;
  UserPublicData userData = UserPublicData.instence;
  final ClientServices _clientServices = ClientServices();

  final TextEditingController date = TextEditingController();
  final DateTime _currentDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  String dropBoxValue =
      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
  DateTime _selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  String? _selectedTime;
  int? _laseInsex;

  List<List<dynamic>> times = [
    ["08:30", Color.fromARGB(255, 225, 249, 253)],
    ["09:00", Color.fromARGB(255, 225, 249, 253)],
    ["09:30", Color.fromARGB(255, 225, 249, 253)],
    ["10:00", Color.fromARGB(255, 225, 249, 253)],
    ["10:30", Color.fromARGB(255, 225, 249, 253)],
    ["11:00", Color.fromARGB(255, 225, 249, 253)],
    ["11:30", Color.fromARGB(255, 225, 249, 253)],
    ["12:00", Color.fromARGB(255, 225, 249, 253)],
    ["12:30", Color.fromARGB(255, 225, 249, 253)],
    ["13:00", Color.fromARGB(255, 225, 249, 253)],
    ["13:30", Color.fromARGB(255, 225, 249, 253)],
    ["14:00", Color.fromARGB(255, 225, 249, 253)],
    ["14:30", Color.fromARGB(255, 225, 249, 253)],
    ["15:00", Color.fromARGB(255, 225, 249, 253)],
    ["15:30", Color.fromARGB(255, 225, 249, 253)],
    ["16:00", Color.fromARGB(255, 225, 249, 253)],
    ["16:30", Color.fromARGB(255, 225, 249, 253)],
    ["17:30", Color.fromARGB(255, 225, 249, 253)],
    ["18:00", Color.fromARGB(255, 225, 249, 253)],
    ["18:30", Color.fromARGB(255, 225, 249, 253)],
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
                      ],
                    ),
                    SearshIconButton(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 425.r,
                          width: 425.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: appointmentEntiti.image.isEmpty
                                  ? AssetImage("assets/images/pr1.jpg")
                                  : NetworkImage(appointmentEntiti.image),
                            ),
                          ),
                        ),
                        SizedBox(width: 30.w),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: "اسم الطبيب : ",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.sp,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            "${appointmentEntiti.fName} ${appointmentEntiti.lName}",
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 40.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 20.h),
                                RichText(
                                  text: TextSpan(
                                    text: "الاختصاص : ",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.sp,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: appointmentEntiti.specialistType,
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 40.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 20.h),
                                RichText(
                                  text: TextSpan(
                                    text: "العنوان : ",
                                    style: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40.sp,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: appointmentEntiti.address,
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 40.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                CustomText(
                                  "السعر : ${appointmentEntiti.prix}دج",
                                  maxLines: 6,
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: StatefulBuilder(
                      builder: (BuildContext context, setState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton(
                              underline: Container(),
                              borderRadius: BorderRadius.circular(8),
                              isExpanded: true,
                              value: dropBoxValue,
                              onChanged: (val) {
                                setState(() {
                                  dropBoxValue = val!;
                                  if (val! ==
                                      "${_currentDate.day + 1}/${_currentDate.month}/${_currentDate.year}") {
                                    _selectedDate = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day + 1,
                                    );
                                    times.forEach((val) {
                                      val[1] = Color.fromARGB(
                                        255,
                                        225,
                                        249,
                                        253,
                                      );
                                    });
                                  } else {
                                    times.forEach((val) {
                                      val[1] = Color.fromARGB(
                                        255,
                                        225,
                                        249,
                                        253,
                                      );
                                    });
                                    _selectedDate = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                    );
                                  }
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  child: CustomText(
                                    "${_currentDate.day}/${_currentDate.month}/${_currentDate.year}",
                                  ),
                                  value:
                                      "${_currentDate.day}/${_currentDate.month}/${_currentDate.year}",
                                ),
                                DropdownMenuItem(
                                  child: CustomText(
                                    "${_currentDate.day + 1}/${_currentDate.month}/${_currentDate.year}",
                                  ),
                                  value:
                                      "${_currentDate.day + 1}/${_currentDate.month}/${_currentDate.year}",
                                ),
                              ],
                            ),

                            StreamBuilder(
                              stream: _clientServices
                                  .getAppointmentOfServiceStraem(
                                    appointmentEntiti.id,
                                    _currentDate.toString(),
                                  ),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  List<Map<String, dynamic>> data =
                                      snapshot.data;

                                  List<GetAppointmentEntiti>
                                  appointmentData = data
                                      .where(
                                        (dataMap) => DateTime.parse(
                                          dataMap["appointment_date"],
                                        ).isAfter(_selectedDate),
                                      )
                                      .map((element) {
                                        DateTime dateTime = DateTime.parse(
                                          element["appointment_date"],
                                        );
                                        return GetAppointmentEntiti(
                                          time:
                                              "${dateTime.hour}:${dateTime.minute}",
                                          date:
                                              "${dateTime.day}/${dateTime.month}/${dateTime.year}",
                                        );
                                      })
                                      .toList();

                                  times.forEach((element) {
                                    appointmentData.forEach((val) {
                                      if (Time(
                                            hore: int.parse(
                                              element[0].toString().split(
                                                ":",
                                              )[0],
                                            ),
                                            min: int.parse(
                                              element[0].toString().split(
                                                ":",
                                              )[1],
                                            ),
                                          ) ==
                                          Time(
                                            hore: int.parse(
                                              val.time.split(":")[0],
                                            ),
                                            min: int.parse(
                                              val.time.split(":")[1],
                                            ),
                                          )) {
                                        element[1] = Colors.red[200];
                                        _laseInsex = null;
                                      }
                                    });
                                  });
                                }
                                return StatefulBuilder(
                                  builder: (BuildContext context, setState) {
                                    return GridView.builder(
                                      controller: ScrollController(
                                        keepScrollOffset: false,
                                      ),
                                      reverse: false,
                                      shrinkWrap: true,
                                      itemCount: times.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisExtent: 40,
                                          ),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (times[index][1] !=
                                                  Colors.red[200]) {
                                                if (_laseInsex != null) {
                                                  times[_laseInsex!][1] =
                                                      Color.fromARGB(
                                                        255,
                                                        225,
                                                        249,
                                                        253,
                                                      );
                                                  times[index][1] =
                                                      Colors.green[200];
                                                  _laseInsex = index;
                                                  _selectedTime =
                                                      times[index][0];
                                                } else {
                                                  times[index][1] =
                                                      Colors.green[200];
                                                  _laseInsex = index;
                                                  _selectedTime =
                                                      times[index][0];
                                                }
                                              }
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(20.r),
                                            margin: EdgeInsets.all(8.r),
                                            child: CustomText(times[index][0]),
                                            decoration: BoxDecoration(
                                              //border: Border.all(),
                                              color: times[index][1],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomRight: Radius.circular(
                                                  12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 30.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                BlocListener<
                                  ClientServiceBloc,
                                  ClientServiceState
                                >(
                                  listener: (context, state) {
                                    if (state
                                        is ClientServiceSetAppointmentLoadingState) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    }
                                    if (state
                                        is ClientServiceSetAppointmentLoadedState) {
                                      Navigator.pop(context);
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.rightSlide,
                                        title: 'تم بنجاح',
                                        titleTextStyle: GoogleFonts.cairo(),
                                        descTextStyle: GoogleFonts.cairo(),
                                        buttonsTextStyle: GoogleFonts.cairo(
                                          color: Colors.white,
                                        ),
                                        btnCancelText: "إلغاء",
                                        btnOkText: "تأكيد",
                                        desc: 'لقد تم حجز الموعد بنجاح .',
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {},
                                      )..show();
                                    }
                                    if (state
                                        is ClientServiceSetAppointmentErrorState) {
                                      Navigator.pop(context);
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.success,
                                        animType: AnimType.rightSlide,
                                        title: 'خطأ',
                                        titleTextStyle: GoogleFonts.cairo(),
                                        descTextStyle: GoogleFonts.cairo(),
                                        buttonsTextStyle: GoogleFonts.cairo(
                                          color: Colors.white,
                                        ),
                                        btnCancelText: "إلغاء",
                                        btnOkText: "تأكيد",
                                        desc:
                                            'لقد وجدنا خطأ في عملية حجز الموعد.',
                                        btnCancelOnPress: () {},
                                        btnOkOnPress: () {},
                                      )..show();
                                    }
                                  },
                                  child: ElevatedButton(
                                    onPressed: () {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.rightSlide,
                                        title: 'تنبيه',
                                        titleTextStyle: GoogleFonts.cairo(),
                                        descTextStyle: GoogleFonts.cairo(),
                                        buttonsTextStyle: GoogleFonts.cairo(
                                          color: Colors.white,
                                        ),
                                        btnCancelText: "إلغاء",
                                        btnOkText: "تأكيد",
                                        desc:
                                            'لا يمكنك تغيير وقت حجز الموعد عند تأكيد الطلب .',
                                        btnCancelOnPress: () {
                                          BlocProvider.of<ClientServiceBloc>(
                                            context,
                                          ).add(
                                            GetClientAppointmentOfService(
                                              id: appointmentEntiti.id,
                                              date: _currentDate.toString(),
                                            ),
                                          );
                                        },
                                        btnOkOnPress: () {
                                          BlocProvider.of<ClientServiceBloc>(
                                            context,
                                          ).add(
                                            SetClientAppointmentEvent(
                                              appointmentEntiti:
                                                  SetAppointmentEntiti(
                                                    id: appointmentEntiti.id,
                                                    specialistId:
                                                        appointmentEntiti
                                                            .specialistId,
                                                    appointmentDateTime:
                                                        DateTime(
                                                          _selectedDate.year,
                                                          _selectedDate.month,
                                                          _selectedDate.day,
                                                          int.parse(
                                                            _selectedTime!
                                                                .split(":")[0],
                                                          ),
                                                          int.parse(
                                                            _selectedTime!
                                                                .split(":")[1],
                                                          ),
                                                        ),
                                                  ),
                                            ),
                                          );
                                        },
                                      )..show();
                                    },
                                    child: CustomText(
                                      "حجز موعد",
                                      style: GoogleFonts.cairo(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
