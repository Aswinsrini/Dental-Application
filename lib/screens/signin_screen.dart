import 'package:flutter/material.dart';
import 'package:maris_dental/common/custom_button.dart';
import 'package:maris_dental/common/custom_textfield.dart';
import 'package:maris_dental/validation/Auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signinValidate() {
    AuthService().signinValidate(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(9.0),
            child: Container(
              child: SafeArea(
                child: Form(
                    child: Column(
                  children: [
                    Image.asset('images/dental2.jpg'),
                    CustomTextField(
                        controller: _emailController, hintText: 'email'),
                    const SizedBox(height: 11),
                    CustomTextField(
                        controller: _passwordController, hintText: 'password'),
                    const SizedBox(height: 10),
                    CustomButton(
                        onTap: () {
                          signinValidate();
                        },
                        text: 'Sign in')
                  ],
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
