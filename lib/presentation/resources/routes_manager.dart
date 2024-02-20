import 'package:clean_architecture/presentation/onboarding/onboarding_view.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../forget_password/foreget_password.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../register/register_view.dart';
import '../splash/splash_view.dart';
import '../store_details/store_details_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgetPasswordRoute = "/home";
  static const String onboarding = "/onboarding"; 
  static const String main = "/main";
  static const String storesDetailsRoute = "/storesDetailsRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storesDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
              case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      default:
       return unDefiendedRoute();
    }
  }
  static  Route<dynamic> unDefiendedRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text(AppStrings.noScreenFound),),));
  }
}
