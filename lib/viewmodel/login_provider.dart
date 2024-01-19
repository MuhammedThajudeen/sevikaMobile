
import 'package:flutter/material.dart';

class login extends ChangeNotifier {
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  void setShowPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }
}