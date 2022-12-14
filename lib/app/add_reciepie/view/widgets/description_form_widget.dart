import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class DescriptionTextforms extends StatelessWidget {
  const DescriptionTextforms({
    Key? key,
    required this.icon,
    required this.vertical,
    required this.controller,
  }) : super(key: key);
  final IconData icon;
  final double vertical;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(
        top: vertical,
        right: 20,
        left: 20,
      ),
      child: TextFormField(
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please fill this field';
          }
        },
        controller: controller,
        keyboardType: TextInputType.multiline,
        maxLines: 15,
        style: TextStyle(
          color: kPrimary,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          fillColor: kWhite,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(bottom: height / 2.8),
            child: Icon(
              Icons.description,
              color: kPrimary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: kPrimary,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.teal,
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: kPrimary,
              width: 2.0,
            ),
          ),
          hintText: 'Description',
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
