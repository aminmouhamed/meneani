import 'package:flutter/material.dart';
import 'package:naji/core/routing/app_routes.dart';
import 'package:naji/core/widgets/custom_page_route.dart';
import 'package:naji/features/auth/login/ui/bloc/bloc/login_bloc.dart';
import 'package:naji/features/auth/login/ui/widgets/login_page.dart';
import 'package:naji/features/auth/signup/ui/bloc/create_account_bloc.dart';
import 'package:naji/features/auth/signup/ui/widgets/create_client_account_page.dart.dart';
import 'package:naji/features/auth/signup/ui/widgets/create_specialist_account_page.dart';
import 'package:naji/features/chat_room/ui/bloc/chat_rooms_bloc.dart';
import 'package:naji/features/chat_room/ui/widgets/chat_rooms_page.dart';
import 'package:naji/features/client_appointment_services/ui/bloc/client_service_bloc.dart';
import 'package:naji/features/client_chat_service/ui/bloc/client_chat_services_bloc/client_chat_bloc.dart';
import 'package:naji/features/client_chat_service/ui/widgets/client_chat_service_home_page.dart';
import 'package:naji/features/home/ui/bloc/home_service_bloc.dart';
import 'package:naji/features/profile/ui/bloc/profile_bloc.dart';
import 'package:naji/features/profile/ui/widgets/profile_page.dart';
import 'package:naji/features/client_appointment_services/ui/widgets/client_ap_service_page.dart';
import 'package:naji/features/home/ui/bloc/bloc/home_bloc.dart';
import 'package:naji/features/home/ui/widgets/client_home_page.dart';
import 'package:naji/features/home/ui/widgets/specialist_home_page.dart';
import 'package:naji/features/setting/ui/widgets/settings_page.dart';
import 'package:naji/features/specialist_chat_service/ui/bloc/specialist_chat_service_bloc.dart';
import 'package:naji/features/specialist_chat_service/ui/widgets/specialist_chat_service_setting_page.dart';
import 'package:naji/features/specialist_services/ui/bloc/appointment_list/appointment_list_bloc.dart';
import 'package:naji/features/specialist_services/ui/bloc/specialist_services_bloc.dart';
import 'package:naji/features/specialist_services/ui/widgets/appointment_service_page.dart';
import 'package:naji/features/specialist_services/ui/widgets/specialist_appointment_list_page.dart';
import 'package:naji/features/welcome/ui/welcome_page.dart';
import 'package:naji/core/di/di.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouting {
  Route onGenerateRoute(RouteSettings rSetting) {
    switch (rSetting.name) {
      case AppRoutes.welcome:
        return CustomPageRoute(child: WelcomePage());
      case AppRoutes.specialistAppointmentList:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                AppointmentListBloc(getAppointmentListUsecase: di.getIT())
                  ..add(GetSpecialistAppointmentListEvent()),
            child: SpecialistAppointmentListPage(),
          ),
        );
      case AppRoutes.ChatRooms:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                ChatRoomsBloc(getChatRoomsUsecase: di.getIT())
                  ..add(GetChatRoomsEvent()),
            child: ChatRoomsPage(),
          ),
        );
      case AppRoutes.chatServiceHome:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                ClientChatBloc(
                  getSpecialistChatServiceUsecase: di.getIT(),
                  insertChatRoomUsecase: di.getIT(),
                )..add(
                  GetSpecialistChatServicesEvent(
                    specialistType: "مختص في الأمراض العقلية",
                  ),
                ),
            child: ClientChatServiceHomePage(),
          ),
        );
      case AppRoutes.specialistChatServiceSetting:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => SpecialistChatServiceBloc(
              specialistSetChatServiceUsecase: di.getIT(),
              specialistGetChatServiceSettingUsecase: di.getIT(),
            )..add(GetChatServiceSettingsEvent()),
            child: SpecialistChatServiceSettingPage(),
          ),
        );
      case AppRoutes.clientHome:
        return CustomPageRoute(
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    HomeBloc(getClientDataUsecase: di.getIT())
                      ..add(GetUsreDataEvent()),
              ),
              BlocProvider(
                create: (context) => HomeServiceBloc(
                  deleteClientAppointmentUseCase: di.getIT(),
                  getClientAppointmentUseCase: di.getIT(),
                )..add(HomeGetClientAppointmentEvent()),
              ),
            ],
            child: ClientHomePage(),
          ),
        );
      case AppRoutes.clientService:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                ClientServiceBloc(
                  getSpecialistEppointmentServices: di.getIT(),
                  setClientAppointmentUsecase: di.getIT(),
                  getAppointmentOfServiceUsecase: di.getIT(),
                )..add(
                  GetSpecialistAppointmentEvent(
                    SpecialistType: "مختص في الأمراض العقلية",
                  ),
                ),
            child: ClientAppointmentServicePage(),
          ),
        );
      case AppRoutes.apointmentServiceSetting:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => SpecialistServicesBloc(
              updateAppointmentService: di.getIT(),
              getAppointmentSetting: di.getIT(),
            )..add(SpecialistGetAppointmentSettingEvent()),
            child: AppointmentServiceSettingsPage(),
          ),
        );
      case AppRoutes.specialistHome:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                HomeBloc(getClientDataUsecase: di.getIT())
                  ..add(GetUsreDataEvent()),
            child: SpecialistHomePage(),
          ),
        );
      case AppRoutes.setting:
        return CustomPageRoute(child: SettingPage());
      case AppRoutes.profile:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) =>
                ProfileBloc(profileRepository: di.getIT())
                  ..add(GetUserProfileDataEvent()),
            child: ProfilePage(),
          ),
        );

      case AppRoutes.logIn:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => LoginBloc(loginRepository: di.getIT()),
            child: LoginPage(),
          ),
        );

      case AppRoutes.createClientAccount:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => CreateAccountBloc(di.getIT()),
            child: CreateClientAccountPage(),
          ),
        );
      case AppRoutes.createSpecialistAccount:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => CreateAccountBloc(di.getIT()),
            child: CreateSpecialistAccountPage(),
          ),
        );
      default:
        return CustomPageRoute(child: Container());
    }
  }
}
