import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  double _fontSize = 16.0;

  // ফন্ট সাইজ গেটার (Getter)
  double get fontSize => _fontSize;

  // ফন্ট সাইজ পরিবর্তনের মেথড
  void updateFontSize(double size) {
    _fontSize = size;
    notifyListeners(); // এটি পুরো অ্যাপে ফন্ট সাইজ আপডেট করবে
  }
}


