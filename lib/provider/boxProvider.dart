import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BoxProvider extends ChangeNotifier {
  Box<Map<dynamic, dynamic>> mybox = Hive.box('mybox');

  add(Map<dynamic, dynamic> all) {
    mybox.add(all);
    notifyListeners();
  }
  delate(int index) {
    mybox.deleteAt(index);
    notifyListeners();
  }
}
