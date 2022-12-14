import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../login/view_model/login_provider.dart';

class PasswordTextFormWidget extends StatelessWidget {
  const PasswordTextFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 40, left: 40),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return " Please fill this field";
          } else if (value.length < 6) {
            return " Password is less than six";
          }
          return null;
        },
        controller: context.read<LoginProvider>().password,
        style: TextStyle(
          color: kPrimary,
          fontSize: 18,
        ),
        obscuringCharacter: '*',
        obscureText: true,
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(
              Icons.key,
              color: kTeal,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: kPrimary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              width: 2.0,
            ),
          ),
          hintText: "password",
          hintStyle: TextStyle(
            fontSize: 15,
            color: kPrimary,
          ),
        ),
      ),
    );
  }
}
