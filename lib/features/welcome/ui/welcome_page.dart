import 'package:flutter/material.dart';
import 'package:meneani/core/routing/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("welcome screen"),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.logIn);
                },
                child: Text("logIn"),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.signin);
                },
                child: Text("SignIn"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
