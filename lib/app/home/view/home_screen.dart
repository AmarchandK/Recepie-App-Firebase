import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wit_task/app/home/view/widgets/bottom_nav.dart';
import '../view_model/home_provider.dart';
import 'widgets/presized_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: PresizedAppBarWidget(),
      ),
      body: Consumer<HomeProvider>(builder: (context, value, _) {
        return value.pages[value.pageIndex];
      }),
      bottomNavigationBar: const BottomNavyWidget(),
    ));
  }
}
