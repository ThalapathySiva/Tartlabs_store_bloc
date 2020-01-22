import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_bloc.dart';
import 'package:tartlabs_store_bloc/authentication/authentication_states.dart';
import 'package:tartlabs_store_bloc/home/app_bloc.dart';
import 'package:tartlabs_store_bloc/home/app_events.dart';
import 'package:tartlabs_store_bloc/home/home_screen.dart';
import 'package:tartlabs_store_bloc/login/login_bloc.dart';
import 'package:tartlabs_store_bloc/login/login_screen.dart';

class AppRoutes {
  static const String HOME_SCREEN = "home_screen";
  static const String LOGIN_SCREEN = "login_screen";
  static const String SPLASH_SCREEN = "splash_screen";
}

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.LOGIN_SCREEN:
      return _buildLoginScreen();
    case AppRoutes.HOME_SCREEN:
      return _buildHomeScreen();
  }
}

_buildHomeScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(context, PageBuilder.buildHomeScreen()),
  );
}

_buildLoginScreen() {
  return MaterialPageRoute(
    builder: (context) => addAuthBloc(context, PageBuilder.buildLoginScreen()),
  );
}

class PageBuilder {
  static Widget buildLoginScreen() {
    return BlocProvider(
      create: (context) {
        AuthenticationBloc authBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return LoginBloc(authBloc);
      },
      child: LoginScreen(),
    );
  }

  static Widget buildHomeScreen() {
    return BlocProvider(
      create: (context) {
        AuthenticationBloc authBloc =
            BlocProvider.of<AuthenticationBloc>(context);
        return AppListBloc(authBloc)..add(AppListInitialEvent());
      },
      child: HomeScreen(),
    );
  }
}

addAuthBloc(BuildContext context, Widget widget) {
  return BlocListener(
    bloc: BlocProvider.of<AuthenticationBloc>(context),
    listener: (context, state) {
      ScreenUtil.init(context, width: 375, height: 812);
      if (state is UnAuthenticatedState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN);
      }
      if (state is AuthenticatedState) {
        while (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
        Navigator.pushReplacementNamed(context, AppRoutes.HOME_SCREEN);
      }
    },
    child: BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context),
      builder: (context, state) {
        return widget;
      },
    ),
  );
}
