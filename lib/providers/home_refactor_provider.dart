import 'package:flutter/cupertino.dart';
import '../models/model_widget/item_radio.dart';

class HomeRefactorProvider extends ChangeNotifier {
  List<ItemRadio> get list => listItemCustom;
  List<ItemRadio> oldData = listItemCustom;

  void updateSelectedItem(
      int selectedIndex, bool notify, BuildContext context) {
    for (int i = 0; i < listItemCustom.length; i++) {
      listItemCustom[i].isSelected = (i == selectedIndex);
    }
    if (notify) notifyListeners();
  }
}
