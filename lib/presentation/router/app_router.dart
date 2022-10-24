import 'package:flutter/material.dart';
import 'package:flutter_form_demo/presentation/screens/sign_up/sign_up_screen.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/dashboard/dashboard_screen.dart';

class AppRouter {
  static const String dashboard = '/';
  static const String signUp = '/sign-up';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(
            settings: const RouteSettings(name: dashboard),
            builder: (_) =>  const DashboardScreen());
      case signUp:
        return MaterialPageRoute(
            settings: const RouteSettings(name: signUp),
            builder: (_) =>  const SignUpScreen());
      default:
        throw const RouteException('Route not found!');
    }
  }
}
