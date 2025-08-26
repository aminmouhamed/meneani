import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/routing/app_routes.dart';
import 'package:naji/core/widgets/custom_text.dart';
import 'package:naji/features/connectivity/ui/404.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});
  SupabaseClient _supabaseClient = Supabase.instance.client;
  UserPublicData _userData = UserPublicData.instence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 2,
        selectedItemColor: AppColors.therdColor,
        selectedLabelStyle: GoogleFonts.cairo(),
        unselectedLabelStyle: GoogleFonts.cairo(),
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.profile);
              break;
            case 1:
              Navigator.of(context).pushReplacementNamed(
                _userData.UserType == "client"
                    ? AppRoutes.clientHome
                    : AppRoutes.specialistHome,
              );
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
      body: SafeArea(
        child: InternetConnectionsCheker(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () async {},
                  child: CustomText("عربي", style: GoogleFonts.cairo()),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {},
                  child: CustomText("Français", style: GoogleFonts.cairo()),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {},
                  child: CustomText("English", style: GoogleFonts.cairo()),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _supabaseClient.auth.signOut();
                    await sharedPreferences!.remove("user_type");
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.welcome);
                  },
                  child: CustomText("تسجيل الخروج", style: GoogleFonts.cairo()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
