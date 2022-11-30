import 'package:flutter/widgets.dart';
import '../../add_reciepie/view/add_recipe.dart';
import '../../receipe_screen/view/receipe_screen.dart';
import '../../settings/view/settings_screen.dart';

class HomeProvider with ChangeNotifier {
  int pageIndex = 1;
  bool showAppbar = true;
  final pages = [
    const AddReceipeScreen(),
    const ReciepeScreen(),
    const SettingsScreen(),
  ];

  onTabIndexChange(int number) {
    pageIndex = number;
    notifyListeners();
  }
}
