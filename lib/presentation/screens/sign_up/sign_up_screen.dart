import 'package:flutter/material.dart';
import 'package:flutter_form_demo/core/extensions/string_extension.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  DateTime? birthDay;
  String? gender;

  bool _isDOBEmpty = false;
  bool _isGenderEmpty = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Form"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                InputFormField(
                  title: "First Name",
                  child: InputTextField(
                    hint: "First Name",
                    textEditingController: _firstName,
                    textInputAction: TextInputAction.next,
                    validation: (val) {
                      if (val == null || val.isEmpty) {
                        return "This field is required and cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                InputFormField(
                  title: "Last Name",
                  child: InputTextField(
                    hint: "Last Name",
                    textEditingController: _lastName,
                    textInputAction: TextInputAction.next,
                    validation: (val) {
                      if (val == null || val.isEmpty) {
                        return "This field is required and cannot be empty";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                InputFormField(
                  title: "Email",
                  child: InputTextField(
                    hint: "Email address",
                    textEditingController: _email,
                    textInputAction: TextInputAction.next,
                    validation: (val) {
                      if (val == null || val.isEmpty) {
                        return "This field is required and cannot be empty";
                      }
                      if (!val.isValidEmail) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
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
                        _isDOBEmpty = birthDay == null;
                      });
                    },
                    date: birthDay,
                  ),
                ),
                if (_isDOBEmpty)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "This field is required and cannot be empty",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                const SizedBox(height: 10),
                InputFormField(
                  title: "Gender",
                  child: InputDropdown(
                    onChange: (String? val) {
                      gender = val;
                      setState(() {
                        _isGenderEmpty = gender == null;
                      });
                    },
                    hint: 'Gender',
                    value: gender,
                    items: const ["Male", "Female", "Other"],
                  ),
                ),
                if (_isGenderEmpty)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "This field is required and cannot be empty",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                const SizedBox(height: 25),
                InputFormField(
                  title: "Password",
                  child: InputTextField(
                    hint: "Password",
                    textEditingController: _password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    validation: (val) {
                      List<String> validation = [];
                      if (val == null || val.isEmpty) {
                        validation
                            .add('This field is required and cannot be empty!');
                      } else {
                        if (val.length < 8) {
                          validation.add("• Minimum 8 characters.");
                        }
                        if (!val.isValidPasswordHasNumber) {
                          validation.add("• A number from [0-9].");
                        }
                        if (!val.isValidPasswordHasCapitalLetter) {
                          validation.add("• A capital letter [AZ].");
                        }
                        if (!val.isValidPasswordHasLowerCaseLetter) {
                          validation.add("• A lowercase letter [az].");
                        }
                        if (!val.isValidPasswordHasSpecialCharacter) {
                          validation
                              .add("• A special character [! @ # \$% ^ & *].");
                        }
                      }

                      if (validation.isNotEmpty) {
                        String msg = '';
                        for (var i = 0; i < validation.length; i++) {
                          msg = msg + validation[i];
                          if ((i + 1) != validation.length) {
                            msg = "$msg\n";
                          }
                        }
                        return msg;
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                InputFormField(
                  title: "Confirm Password",
                  child: InputTextField(
                    hint: "Confirm Password",
                    textEditingController: _confirmPassword,
                    obscureText: true,
                    textInputAction: TextInputAction.go,
                    validation: (val) {
                      if (val == null || val.isEmpty) {
                        return "This field is required and cannot be empty";
                      }
                      if (_password.text != val) {
                        return "Confirm password doesn't match";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                InputTextButton(
                    title: "Sign Up",
                    onClick: () {
                      setState(() {
                        _isDOBEmpty = birthDay == null;
                        _isGenderEmpty = gender == null;
                      });
                      if (_formKey.currentState!.validate() &&
                          _isGenderEmpty &&
                          _isDOBEmpty) {
                        print("test");
                      }
                    }),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
