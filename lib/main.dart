import 'package:flutter/material.dart';

import 'core/themes/app_theme.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        initialRoute: AppRouter.dashboard,
        onGenerateRoute: AppRouter.onGenerateRoute);
  }
}
