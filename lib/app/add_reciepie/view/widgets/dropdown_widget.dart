import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/colors.dart';
import '../../view_model/auth_services.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddRecipiAuth>(builder: (context, run, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
        child: DropdownButton<String>(
          focusColor: kPrimary,
          value: run.selectItem,
          items: <String>[
            'Hours',
            'minutes',
            'Seconds',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newValue) {
            run.selectTeam(newValue.toString());
          },
        ),
      );
    });
  }
}
