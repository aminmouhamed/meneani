import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/widgets/simpel_button.dart';
import 'package:meneani/features/home/ui/widgets/widgets/custom_card.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
        toolbarHeight: 100,
        //backgroundColor: AppColors.secendaryColor,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/profil_img.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(width: 30.h),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning , Amin.!",
                                style: TextStyle(
                                  fontSize: 55.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Keep taking care your health !.",
                                style: TextStyle(fontSize: 40.sp),
                              ),
                            ],
                          ),
                          NotificationsIconButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(40.r),
          child: Column(
            children: [
              Row(
                children: [
                  CustomCard(
                    titel: "Online Doctor  Conseltation",
                    bgColor: AppColors.therdColor.withAlpha(150),
                    buttonText: "",
                  ),
                  SizedBox(width: 30.h),
                  CustomCard(
                    titel: "Visit a Doctor \nOffline",
                    bgColor: AppColors.secendaryColor.withAlpha(150),
                    buttonText: "",
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              CustomCard2(
                titel: "Othematic Guidance",
                bgColor: AppColors.primeryColor.withAlpha(150),
                buttonText: "",
              ),
            ],
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
