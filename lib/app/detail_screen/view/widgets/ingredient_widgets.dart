import 'package:flutter/material.dart';
import 'package:wit_task/constants/colors.dart';

class IngredientWidgetCard extends StatelessWidget {
  const IngredientWidgetCard({
    Key? key,
    required this.incredents,
  }) : super(key: key);
  final Map<String, dynamic> incredents;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _chips(key: 'ingredient1', value: 'quantity1'),
        _chips(key: 'ingredient2', value: 'quantity2'),
        _chips(key: 'ingredient3', value: 'quantity3'),
        _chips(key: 'ingredient4', value: 'quantity4'),
        _chips(key: 'ingredient5', value: 'quantity5'),
      ],
    );
  }

  Widget _chips({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
          disabledColor: kPrimary,
          label: Text(
            "${incredents[key]} : ${incredents[value]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected: false),
    );
  }
}
