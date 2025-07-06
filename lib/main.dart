import 'package:flutter/material.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/core/routing/app_routing.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:meneani/core/di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Supabase.initialize(
    url: "https://jqyvvweduezpfuioxbyc.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpxeXZ2d2VkdWV6cGZ1aW94YnljIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE3MTExODksImV4cCI6MjA2NzI4NzE4OX0._dbEwwnOjbULo0kffMqi10-z4t5ebm3HM6dtKMZXv5w",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  AppRouting appRouting = AppRouting();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meneani',
      onGenerateRoute: appRouting.onGenerateRoute,
      initialRoute: AppRoutes.welcome,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    );
  }
}
