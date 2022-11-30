// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../utility/view/email_form.dart';
import '../../../utility/view/password_form.dart';
import '../../view_model/login_provider.dart';

class LoginTextforms extends StatelessWidget {
  const LoginTextforms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginProvider>().formKey,
      child: Column(
        children: [
          const EmailTextFormWidget(),
          const PasswordTextFormWidget(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 15,
                    ), backgroundColor: kPrimary,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                  onPressed: (() async {
                    context.read<LoginProvider>().onTabLoginFunction(
                          context,
                        );
                  }),
                  child: context.watch<LoginProvider>().isLoading == false
                      ? const Text(
                          "LOGIN",
                        )
                      : const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
