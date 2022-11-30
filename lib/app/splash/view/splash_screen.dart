import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SpalshProvider>(context, listen: false).goHome(context);
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset('assets/logo.png'),
        ),
      ),
    );
  }
}
