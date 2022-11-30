import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../add_reciepie/model/ingredient_model.dart';
import '../../../add_reciepie/view_model/auth_services.dart';

class IngredientWidgetCard extends StatelessWidget {
  const IngredientWidgetCard({
    Key? key,
    required this.ingredientListModel,
  }) : super(key: key);
  final IngredientListModel ingredientListModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Text(context
                      .read<AddRecipiAuth>()
                      .ingredientListModel
                      .ingredient1
                      .toString())),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 6,
                  child: Text(context
                      .read<AddRecipiAuth>()
                      .ingredientListModel
                      .quantity1
                      .toString()))
            ],
          ),
        ),
      ],
    );
  }
}
