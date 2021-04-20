import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_alif/models/model.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: avoid_init_to_null
  List<Model> _todoList = null;

  // ignore: unnecessary_getters_setters
  List<Model> get todoList => _todoList;

  // ignore: unnecessary_getters_setters
  set todoList(List<Model> list) {
    _todoList = list;
    // notifyListeners();
  }

  int _count = 0;

  int get count => _count;

  set count(counter) {
    _count = counter;
  }

  Model _model;

  Model get modelProvider => _model;

  set modelProvider(mod) {
    _model = mod;
    notifyListeners();
  }

  /*  String _status;
  String get status => _status;
  set status(statused){
    _status = statused;
   // notifyListeners();
  } */

 Model buildBody(BuildContext context, int index, Model model) {
    model = todoList[index];
    return model;
  }

  /*  int get todoListCount => _todoList.length;
  set todoListCount(int count) {
    _todoList.length = count;
  }

  List<Model> get todoListW =>
      _todoList.where((todo) => todo.isDone == false).toList();

  List<Model> get todosCompleted =>
      _todoList.where((todo) => todo.isDone == true).toList();

  bool toggleStatusesList(Model model) {
    model.isDone = !model.isDone;
    notifyListeners();
    return model.isDone;
  } */
}
