// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes/routes.dart';
import '../../add_reciepie/view_model/auth_services.dart';
import '../../home/view/home_screen.dart';
import '../../utility/view_model/snack_provider.dart';
import '../model/user_model.dart';

class SignUpProvider with ChangeNotifier {
  final signUpFormKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final email = TextEditingController();
  UserModel loggedUserModel = UserModel();
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signUp(
    BuildContext context,
  ) async {
    if (signUpFormKey.currentState!.validate()) {
      if (password.text != confirmPassword.text) {
        context
            .read<SnackTProvider>()
            .errorPassword(context, "password not matching");
      } else {
        try {
          await auth
              .createUserWithEmailAndPassword(
                  email: email.text, password: password.text)
              .then((value) => {postDetailsToFirebase(context)});
        } on FirebaseAuthException catch (ex) {
          context
              .read<SnackTProvider>()
              .errorBox(context, ex.message.toString());
        }
      }
    }
  }

  void postDetailsToFirebase(BuildContext context) async {
    // calling our fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    //calling our userModel

    loggedUserModel.email = user!.email;
    loggedUserModel.uid = user.uid;
    loggedUserModel.username = userName.text;

    //sending details to fireStore
    await firebaseFirestore.collection('users').doc(user.email).set(
          loggedUserModel.toMap(),
        );
    disposeControll();
    context.read<SnackTProvider>().successSnack(context);
    await context.read<AddRecipiAuth>().getDataFromCloud(context);
    await RoutesProvider.removeScreenUntil(screen: const HomeScreen());
  }

  disposeControll() {
    userName.clear();
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}
