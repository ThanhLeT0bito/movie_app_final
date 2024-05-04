import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:movie_app_final/models/model_widget/item_radio.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en'); // Ngôn ngữ mặc định là tiếng Anh
  final _selectedIndex = 0;
  bool _isSelectButton = false;
  String _language = 'EN';

  Locale get locale => _locale;

  int get selectedIndex => _selectedIndex;

  bool get isSelectButton => _isSelectButton;

  String get language => _language;

  void changeLanguage(ItemRadio item) {
    _isSelectButton = true;
    if (item.id == 'EN') {
      _language = 'EN';
      _locale = const Locale.fromSubtags(languageCode: 'en');
    } else {
      _language = 'VN';
      _locale = const Locale.fromSubtags(languageCode: 'vi');
    //  _locale = const Locale('vi', 'VN');
    }
    notifyListeners();
  }
}