import 'package:flutter/material.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/features/auth/login/ui/widgets/login_page.dart';
import 'package:meneani/features/auth/signin/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signin/ui/widgets/signin_page.dart';
import 'package:meneani/features/welcome/ui/welcome_page.dart';
import 'package:meneani/core/di/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings rSetting) {
    switch (rSetting.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (context) => WelcomePage());

      case AppRoutes.logIn:
        return MaterialPageRoute(builder: (context) => LoginPage());

      case AppRoutes.signin:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreateAccountBloc(di.getIT()),
            child: SigninPage(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
