import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/app_button.dart';
import 'package:flutter_application_1/components/app_text_field.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void register() async {
    if (passwordController.text == confirmPasswordController.text) {
      final AuthResponse res = await Supabase.instance.client.auth.signUp(
        email: emailController.text,
        password: passwordController.text,
      );

      final box = GetStorage();
      box.write('session', res.session);
      box.write('user', res.user);
    }
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
              "Silahkan\nMendaftar Akun",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              label: "Email",
              controller: emailController,
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
            AppTextField(
              label: "Confirm Password",
              controller: confirmPasswordController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              text: "Register",
              color: Colors.blue,
              onPressed: () {
                // TODO
              },
            ),
            const SizedBox(
              height: 10,
            ),
            AppButton(
              text: "Login",
              color: Colors.grey,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
