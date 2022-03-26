import 'package:crm/core/components/api.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class Boxservice {
  static Box<Map<dynamic, dynamic>>? mybox;

  static putData(Map<dynamic, dynamic> data) async {
    await mybox!.add(data);
  }

  static makeBox() async {
    mybox = await Hive.openBox('mybox');
  }

  static delate(int index) {
    mybox!.deleteAt(index);
  }
}
