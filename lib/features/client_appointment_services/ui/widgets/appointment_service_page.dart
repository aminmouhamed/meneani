import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/time.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/auth/signup/ui/widgets/widgets/customdatepicker.dart';
import 'package:meneani/features/client_appointment_services/data/service/client_services_services.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/get_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/domain/entities/set_appointment_entiti.dart';
import 'package:meneani/features/client_appointment_services/ui/bloc/client_service_bloc.dart';
import 'package:meneani/features/client_appointment_services/ui/widgets/client_ap_service_page.dart';

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
    ["08:30", Colors.black12],
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
                        Hero(
                          tag: userData.userImage,
                          child: Container(
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
                            image: appointmentEntiti.image.isEmpty
                                ? AssetImage("assets/images/pr1.jpg")
                                : NetworkImage(appointmentEntiti.image),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DropdownButton(
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
                                    val[1] = Colors.black12;
                                  });
                                } else {
                                  times.forEach((val) {
                                    val[1] = Colors.black12;
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
                                List<Map<String, dynamic>> data = snapshot.data;

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
                                            element[0].toString().split(":")[0],
                                          ),
                                          min: int.parse(
                                            element[0].toString().split(":")[1],
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
                                                    Colors.black12;
                                                times[index][1] =
                                                    Colors.green[200];
                                                _laseInsex = index;
                                                _selectedTime = times[index][0];
                                              } else {
                                                times[index][1] =
                                                    Colors.green[200];
                                                _laseInsex = index;
                                                _selectedTime = times[index][0];
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
                                            color: times[index][1],
                                            borderRadius: BorderRadius.circular(
                                              12,
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
                                                  appointmentDateTime: DateTime(
                                                    _selectedDate.year,
                                                    _selectedDate.month,
                                                    _selectedDate.day,
                                                    int.parse(
                                                      _selectedTime!.split(
                                                        ":",
                                                      )[0],
                                                    ),
                                                    int.parse(
                                                      _selectedTime!.split(
                                                        ":",
                                                      )[1],
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
    );
  }
}
