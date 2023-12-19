import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:flutter_application_1/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Silahkan\nLogin",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              label: "Username",
              controller: usernameController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              label: "Password",
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              text: "Login",
              color: Colors.blue,
              onPressed: () {
                // TODO
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              text: "Register",
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RegisterPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
