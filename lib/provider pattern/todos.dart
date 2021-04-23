import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_alif/models/model.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: avoid_init_to_null
  List<Model> _todoList;
  List<Model> todoListProvider;
  Model model;

  // ignore: unnecessary_getters_setters
  List<Model> get todoList => _todoList;

  // ignore: unnecessary_getters_setters
  set todoList(List<Model> list) {
    _todoList = list;
  }

  int _count = 0;

  int get countProvider => _count;

  int get todoListCount => _todoList.length;

  set todoListCount(int count) {
    _todoList.length = count;
    notifyListeners();
  }
}
