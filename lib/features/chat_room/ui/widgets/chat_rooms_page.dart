import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/di/di.dart' as di;
import 'package:meneani/core/widgets/custom_page_route.dart';
import 'package:meneani/core/widgets/custom_text.dart';
import 'package:meneani/features/chat_room/domain/entiti/chat_room_entiti.dart';
import 'package:meneani/features/chat_room/ui/bloc/chat_rooms_bloc.dart';
import 'package:meneani/features/connectivity/ui/404.dart';
import 'package:meneani/features/messaging/ui/bloc/messaging_service_bloc.dart';
import 'package:meneani/features/messaging/ui/widgets/messaging_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatRoomsPage extends StatelessWidget {
  ChatRoomsPage({super.key});

  final UserPublicData _userData = UserPublicData.instence;
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
                              image: _userData.userImage.isEmpty
                                  ? AssetImage("assets/images/pr1.jpg")
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
                              "لوحة الإشعارات .",
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
          child: Column(
            children: [
              BlocListener<ChatRoomsBloc, ChatRoomsState>(
                listener: (context, state) {
                  if (state is ChatRoomsLoadingState) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          Center(child: CircularProgressIndicator()),
                    );
                  }
                  if (state is ChatRoomsLoadedState) {
                    Navigator.pop(context);
                  }
                  if (state is ChatRoomsErrorState) {
                    Navigator.pop(context);
                  }
                },
                child: Container(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
                    builder: (context, state) {
                      List<ChatRoomEntiti> data = [];
                      if (state is ChatRoomsLoadedState) {
                        data = state.chatRooms;
                      }

                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                  child: BlocProvider(
                                    create: (context) => MessagingServiceBloc(
                                      sendMessageUsecase: di.getIT(),
                                    ),
                                    child: MessagingPage(
                                      roomId: data[index].roomId,
                                      userName:
                                          "${data[index].uFName} ${data[index].uLName} ",
                                      image: data[index].uImage,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(30.r),
                              margin: EdgeInsets.only(top: 30.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 200.r,
                                    width: 200.r,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: data[index].uImage.isEmpty
                                            ? AssetImage(
                                                "assets/images/pr1.jpg",
                                              )
                                            : NetworkImage(data[index].uImage),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30.w),
                                  CustomText(
                                    style: GoogleFonts.cairo(fontSize: 50.sp),
                                    "${data[index].uFName} ${data[index].uLName} "
                                        .toUpperCase(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
