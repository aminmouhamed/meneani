import 'package:flutter/material.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/generated/l10n.dart';

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
                  Navigator.of(context).pushReplacementNamed(AppRoutes.logIn);
                },
                child: Text(S.current.login),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.createClientAccount);
                },
                child: Text(S.current.create_client_account),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.createSpecialistAccount);
                },
                child: Text(S.current.create_specialist_account),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
