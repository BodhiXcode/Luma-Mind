import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luma_mind/screen/home_screen.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerFormKey = GlobalKey<ShadFormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            ShadForm(
              key: registerFormKey,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      ShadInputFormField(
                        id: "username",
                        label: const Text("Username"),
                        placeholder: const Text("What is your name buddy?"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Username is required';
                          }
                          if (value.trim().length < 4) {
                            return 'Username must be at least 4 characters';
                          }
                          return null;
                        },
                      ),
                      ShadInputFormField(
                        id: "email",
                        label: const Text("Email"),
                        placeholder: const Text("Your Email id"),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      ShadInputFormField(
                        obscureText: true,
                        id: "password",
                        label: const Text("Password"),
                        placeholder: const Text(
                          "A strong password to keep things private",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          final complexRegex = RegExp(
                            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{6,}$',
                          );
                          if (!complexRegex.hasMatch(value)) {
                            return 'Password must include upper, lower, number, and special character';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(),
                      Row(
                        spacing: 15,
                        children: [
                          ShadButton.secondary(
                            onPressed: () {},
                            child: Text("Login"),
                          ),
                          Expanded(
                            child: ShadButton(
                              onPressed: () {
                                if (registerFormKey.currentState!
                                    .saveAndValidate()) {
                                  Get.off(() => HomeScreen());
                                }
                              },
                              child: Text("Register me"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
