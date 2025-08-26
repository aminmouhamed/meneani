import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/features/specialist_services/ui/bloc/appointment_list/appointment_list_bloc.dart';

class SpecialistAppointmentListPage extends StatelessWidget {
  const SpecialistAppointmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomText("المواعيد", style: GoogleFonts.cairo())),
      body: BlocListener<AppointmentListBloc, AppointmentListState>(
        listener: (context, state) {
          if (state is AppointmentListErrorState) {
            Navigator.pop(context);
          }
          if (state is AppointmentListLaodingState) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          }
          if (state is AppointmentListLoadedState) {
            Navigator.pop(context);
          }
        },
        child: SafeArea(
          child: BlocBuilder<AppointmentListBloc, AppointmentListState>(
            builder: (context, state) {
              if (state is AppointmentListLoadedState) {
                //Navigator.pop(context);
                return ListView.builder(
                  itemCount: state.clientAppointments!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 30.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      padding: EdgeInsets.all(30.w),
                      decoration: BoxDecoration(
                        color: AppColors.therdColor,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        .clientAppointments![index]
                                        .image
                                        .isEmpty
                                    ? AssetImage("assets/images/pr1.jpg")
                                    : NetworkImage(
                                        state.clientAppointments![index].image,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                "${state.clientAppointments![index].fName} ${state.clientAppointments![index].lName}",
                                style: GoogleFonts.cairo(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomText(
                                state.clientAppointments![index].dateTime.split(
                                  "T",
                                )[0],
                                style: GoogleFonts.cairo(),
                              ),
                              CustomText(
                                DateTime.parse(
                                      state.clientAppointments![index].dateTime,
                                    ).hour.toString() +
                                    ":" +
                                    DateTime.parse(
                                      state.clientAppointments![index].dateTime,
                                    ).minute.toString().padLeft(2, "0"),
                                style: GoogleFonts.cairo(),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  BlocProvider.of<AppointmentListBloc>(
                                    context,
                                  ).add(
                                    DeleteAppointmentEvent(
                                      id: state.clientAppointments[index].id,
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
                    );
                  },
                );
              }
              return Center(
                child: Text(
                  "لا توجد أي مواعيد محجوزة .",
                  style: GoogleFonts.cairo(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
