import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meneani/core/const/constent.dart';
import 'package:meneani/core/const/user_public_data.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/features/connectivity/ui/404.dart';
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
      body: InternetConnectionsCheker(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _supabaseClient.auth.signOut();
              await sharedPreferences!.remove("user_type");
              Navigator.of(context).pushReplacementNamed(AppRoutes.welcome);
            },
            child: Text("Logout"),
          ),
        ),
      ),
    );
  }
}
