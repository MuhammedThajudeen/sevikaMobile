import 'package:flutter/material.dart';

import '../models/service_model.dart';

class Servicesdata extends ChangeNotifier {
  Services_model? _data;

  Services_model? get data => _data;

   setData(Services_model? newData) {
    _data = newData;
    notifyListeners();
  }
}