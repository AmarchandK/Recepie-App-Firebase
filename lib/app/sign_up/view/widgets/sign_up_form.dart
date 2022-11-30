import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../view_model/sign_up_provider.dart';
import 'sign_password.dart';
import 'sign_textform.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: context.read<SignUpProvider>().signUpFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SignUpTextforms(
                icon: Icons.person_outline_outlined,
                text: "UserName",
                vertical: 20,
                controller: context.read<SignUpProvider>().userName,
              ),
              SignUpTextforms(
                icon: Icons.mail_outline_sharp,
                text: "Email",
                vertical: 15,
                controller: context.read<SignUpProvider>().email,
              ),
              PasswordTextforms(
                icon: Icons.lock_outline,
                text: "Password",
                obscureText: true,
                vertical: 15,
                controller: context.read<SignUpProvider>().password,
              ),
              PasswordTextforms(
                icon: Icons.lock_reset_outlined,
                text: "Confirm Password",
                obscureText: true,
                vertical: 15,
                controller: context.read<SignUpProvider>().confirmPassword,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 15,
                    ),
                    backgroundColor: kPrimary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<SignUpProvider>().signUp(
                          context,
                        );
                  },
                  child: const Text(
                    "SIGN UP",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
