import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/features/connectivity/ui/404.dart';

import 'package:naji/features/messaging/ui/bloc/messaging_service_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessagingPage extends StatelessWidget {
  final String roomId;
  final String userName;
  final String image;

  MessagingPage({
    super.key,
    required this.roomId,
    required this.userName,
    required this.image,
  });
  SupabaseClient _supabaseClient = Supabase.instance.client;
  late TextEditingController _message = TextEditingController();
  ScrollController? _controller = ScrollController();
  Future<void> goTo() async {
    await Future.delayed(Duration(milliseconds: 300));
    _controller!.jumpTo(_controller!.position.maxScrollExtent);
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
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: this.image.isEmpty
                                  ? AssetImage("assets/images/pr1.jpg")
                                  : NetworkImage(this.image),
                            ),
                          ),
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.userName,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _supabaseClient
                      .from("chat_room_message")
                      .stream(primaryKey: ["id"])
                      .eq("room_id", this.roomId),
                  builder: (context, asyncSnapshot) {
                    List<Map<String, dynamic>> data = [];

                    // if (asyncSnapshot.connectionState ==
                    //     ConnectionState.waiting) {
                    //   return Center(child: CustomText("تحميل ..."));
                    // }
                    if (asyncSnapshot.hasData) {
                      data = asyncSnapshot.data!;
                      // _controller!.animateTo(
                      //   _controller!.position.maxScrollExtent,
                      //   duration: Duration(microseconds: 100),
                      //   curve: Curves.fastOutSlowIn,
                      // );
                      goTo();
                    }

                    return ListView.builder(
                      reverse: false,
                      controller: _controller,
                      itemCount: data.length,
                      itemBuilder: (context, index) => TextMessage(
                        message: data[index]["message"],
                        sender: data[index]["senderId"],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(40.r),
                child: StatefulBuilder(
                  builder: (context, setState) => TextField(
                    controller: _message,
                    decoration: InputDecoration(
                      hintText: "Aa",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<MessagingServiceBloc>(context).add(
                            SendMessageEvent(
                              message: _message.text,
                              roomId: this.roomId,
                            ),
                          );
                          setState(() {
                            _message.text = "";

                            _controller!.animateTo(
                              _controller!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.fastOutSlowIn,
                            );
                          });
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
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

class TextMessage extends StatelessWidget {
  TextMessage({super.key, required this.message, required this.sender});
  final String message;
  final String sender;
  final SupabaseClient _supabaseClient = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: sender == _supabaseClient.auth.currentUser!.id
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 20.r,
            bottom: 20.r,
            left: 30.r,
            right: 30.r,
          ),
          margin: EdgeInsets.all(10.r),
          child: Text(
            textWidthBasis: TextWidthBasis.parent,
            message,
            style: TextStyle(color: Colors.white, fontSize: 57.sp),
          ),
          decoration: BoxDecoration(
            color: sender == _supabaseClient.auth.currentUser!.id
                ? Colors.blue
                : Colors.blueAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: sender == _supabaseClient.auth.currentUser!.id
                  ? Radius.circular(0)
                  : Radius.circular(12),
              topLeft: sender == _supabaseClient.auth.currentUser!.id
                  ? Radius.circular(12)
                  : Radius.circular(0),
            ),
          ),
        ),
      ],
    );
  }
}
