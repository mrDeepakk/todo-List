import 'package:hive_flutter/hive_flutter.dart';

class DataBase {
  final _myBox = Hive.box("MyBox");
  List toDolist = [];

  void loadData() {
    toDolist = _myBox.get("todolist");
  }

  void updateData() {
    _myBox.put("todolist", toDolist);
  }
}
