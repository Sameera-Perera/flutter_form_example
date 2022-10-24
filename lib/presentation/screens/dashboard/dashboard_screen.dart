import 'package:flutter/material.dart';
import 'package:flutter_form_demo/presentation/router/app_router.dart';
import 'package:flutter_form_demo/presentation/widget/input_outline_button.dart';

import '../../widget/input_text_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Forms"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        child: ListView(
          children: [
            InputTextButton(
                title: "Sign Up Form",
                onClick: () {
                  Navigator.of(context).pushNamed(AppRouter.signUp);
                }),
            const SizedBox(height: 10),
            InputOutlineButton(title: "Sign In Form", onClick: () {}),
          ],
        ),
      ),
    );
  }
}
