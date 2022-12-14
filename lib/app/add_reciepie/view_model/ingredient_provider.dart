// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wit_task/app/add_reciepie/model/ingredient_model.dart';
import 'package:wit_task/app/utility/view_model/snack_provider.dart';

class IngredientProvider with ChangeNotifier {
  final ingredientFormKey = GlobalKey<FormState>();
  final ingredient1 = TextEditingController();
  final ingredient2 = TextEditingController();
  final ingredient3 = TextEditingController();
  final TextEditingController ingredient4 = TextEditingController();
  final TextEditingController ingredient5 = TextEditingController();
  final TextEditingController quantity1 = TextEditingController();
  final TextEditingController quantity2 = TextEditingController();
  final TextEditingController quantity3 = TextEditingController();
  final TextEditingController quantity4 = TextEditingController();
  final TextEditingController quantity5 = TextEditingController();
  IngredientListModel ingredientListModel = IngredientListModel();
  Future<void> addIngredientListToRecipi(
    BuildContext context,
  ) async {
    try {
      // calling our fireStore
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      //calling our userModel
      ingredientListModel.ingredient1 = ingredient1.text.trim();
      ingredientListModel.quantity1 = quantity1.text.trim();
      ingredientListModel.ingredient2 = ingredient2.text.trim();
      ingredientListModel.quantity2 = quantity2.text.trim();
      ingredientListModel.ingredient3 = ingredient3.text.trim();
      ingredientListModel.quantity3 = quantity3.text.trim();
      ingredientListModel.ingredient4 = ingredient4.text.trim();
      ingredientListModel.quantity4 = quantity4.text.trim();
      ingredientListModel.ingredient5 = ingredient5.text.trim();
      ingredientListModel.quantity5 = quantity5.text.trim();

      //sending details to fireStore
      await firebaseFirestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('receipi')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('ingredientList')
          .add(
            ingredientListModel.toMap(),
          )
          .then((value) => ingredientDisposeController());
    } on FirebaseException catch (e) {
      context.read<SnackTProvider>().errorBox(context, e.message.toString());
    }
  }

  ingredientDisposeController() {
    ingredient1.clear();
    ingredient2.clear();
    ingredient3.clear();
    ingredient4.clear();
    ingredient5.clear();
    quantity1.clear();
    quantity2.clear();
    quantity3.clear();
    quantity4.clear();
    quantity5.clear();
  }
}
