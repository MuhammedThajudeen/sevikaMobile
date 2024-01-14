import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevika/view/homescreen.dart';
import '../model/domain.dart';

 class carouseldata extends ChangeNotifier {
  domaindata? _data;

  domaindata? get data => _data;

   setData(domaindata? newData) {
    _data = newData;
    notifyListeners();
  }
}