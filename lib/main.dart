import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:naji/core/const/constent.dart';
import 'package:naji/core/const/user_public_data.dart';
import 'package:naji/core/routing/app_routes.dart';
import 'package:naji/core/routing/app_routing.dart';
import 'package:naji/core/theme/app_theme.dart';
import 'package:naji/features/connectivity/bloc/connectivity_bloc.dart';
import 'package:naji/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:naji/core/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await di.init();
  await Supabase.initialize(
    url: "https://jqyvvweduezpfuioxbyc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxeXZ2d2VkdWV6cGZ1aW94YnljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE3MTExODksImV4cCI6MjA2NzI4NzE4OX0._dbEwwnOjbULo0kffMqi10-z4t5ebm3HM6dtKMZXv5w",
  );
  UserPublicData userData = UserPublicData.instence;
  String? userType = await sharedPreferences!.getString("user_type");
  runApp(MyApp(userType: userType));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.userType});
  AppRouting appRouting = AppRouting();
  SupabaseClient _supabaseClient = Supabase.instance.client;
  String? userType;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1280, 2856),
      builder: (context, child) {
        return BlocProvider(
          create: (context) => ConnectivityBloc(),
          child: MaterialApp(
            title: 'Meneani',
            onGenerateRoute: appRouting.onGenerateRoute,
            initialRoute: _supabaseClient.auth.currentUser != null
                ? userType == "client"
                      ? AppRoutes.clientHome
                      : AppRoutes.specialistHome
                : AppRoutes.welcome,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale("ar"),
            theme: lightThem,
            // ThemeData(
            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            //   useMaterial3: true,
            // ),
          ),
        );
      },
    );
  }
}
