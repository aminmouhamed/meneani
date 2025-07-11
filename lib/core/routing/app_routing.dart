import 'package:flutter/material.dart';
import 'package:meneani/core/routing/app_routes.dart';
import 'package:meneani/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:meneani/features/auth/login/ui/widgets/login_page.dart';
import 'package:meneani/features/auth/signin/ui/bloc/create_account_bloc.dart';
import 'package:meneani/features/auth/signin/ui/widgets/create_client_account_page.dart.dart';
import 'package:meneani/features/auth/signin/ui/widgets/create_specialist_account_page.dart';
import 'package:meneani/features/client_profile/ui/widgets/client_profile_page.dart';
import 'package:meneani/features/client_services/ui/client_ap_service_page.dart';
import 'package:meneani/features/home/ui/bloc/bloc/home_bloc.dart';
import 'package:meneani/features/home/ui/widgets/client_home_page.dart';
import 'package:meneani/features/setting/ui/widgets/settings_page.dart';
import 'package:meneani/features/welcome/ui/welcome_page.dart';
import 'package:meneani/core/di/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings rSetting) {
    switch (rSetting.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case AppRoutes.clientHome:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                HomeBloc(homeRepository: di.getIT())..add(GetClientDataEvent()),
            child: ClientHomePage(),
          ),
        );
      case AppRoutes.clientService:
        return MaterialPageRoute(
          builder: (context) => ClientAppointmentServicePage(),
        );
      case AppRoutes.setting:
        return MaterialPageRoute(builder: (context) => SettingPage());
      case AppRoutes.clientProfile:
        return MaterialPageRoute(builder: (context) => ClientProfilePage());

      case AppRoutes.logIn:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginBloc(loginRepository: di.getIT()),
            child: LoginPage(),
          ),
        );

      case AppRoutes.createClientAccount:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreateAccountBloc(di.getIT()),
            child: CreateClientAccountPage(),
          ),
        );
      case AppRoutes.createSpecialistAccount:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CreateAccountBloc(di.getIT()),
            child: CreateSpecialistAccountPage(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
