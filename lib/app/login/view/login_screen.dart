import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../view_model/login_provider.dart';
import 'widgets/login_button.dart';
import 'widgets/login_textform.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        toolbarHeight: MediaQuery.of(context).size.height / 3.5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(0),
            bottomLeft: Radius.circular(100),
          ),
        ),
        title: Image.asset(
          "assets/food/login_food1.png",
          width: MediaQuery.of(context).size.width / 2,
        ),
        centerTitle: true,
      ),
      body: Consumer<LoginProvider>(builder: (context, value, _) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginTextforms(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: kPrimary,
                        fontSize: 15,
                      ),
                    ),
                    const LoginTextButton(
                      text: "Register",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
