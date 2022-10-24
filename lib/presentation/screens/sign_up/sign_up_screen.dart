import 'package:flutter/material.dart';
import 'package:flutter_form_demo/presentation/widget/input_form_field.dart';
import 'package:flutter_form_demo/presentation/widget/input_text_button.dart';

import '../../widget/input_date_field.dart';
import '../../widget/input_dropdown.dart';
import '../../widget/input_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime? birthDay;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const InputFormField(
                title: "First Name",
                child: InputTextField(
                  hint: "First Name",
                ),
              ),
              const SizedBox(height: 10),
              const InputFormField(
                title: "Last Name",
                child: InputTextField(
                  hint: "Last Name",
                ),
              ),
              const SizedBox(height: 10),
              const InputFormField(
                title: "Email",
                child: InputTextField(
                  hint: "Email address",
                ),
              ),
              const SizedBox(height: 10),
              InputFormField(
                title: "Gender",
                child: InputDropdown(
                  onChange: (String? val) {},
                  hint: 'Gender',
                  items: const ["Male", "Female", "Other"],
                ),
              ),
              const SizedBox(height: 10),
              InputFormField(
                title: "Date of birth",
                child: InputDateField(
                  hint: "Date of birth",
                  onChange: (DateTime date) {
                    setState(() {
                      birthDay = date;
                    });
                  },
                  date: birthDay,
                ),
              ),
              const SizedBox(height: 25),
              const InputFormField(
                title: "Password",
                child: InputTextField(
                  hint: "Password",
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 10),
              const InputFormField(
                title: "Confirm Password",
                child: InputTextField(
                  hint: "Confirm Password",
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              InputTextButton(title: "Sign Up", onClick: () {})
            ],
          ),
        ),
      ),
    );
  }
}
