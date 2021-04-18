import 'package:flutter/foundation.dart';
import 'package:flutter_app_alif/models/model.dart';

class TodosProvider extends ChangeNotifier {
  List<Model> _todoList=[];

  List<Model> get todoList =>
      _todoList.where((todo) => todo.isDone == false).toList();

  List<Model> get todosCompleted =>
      _todoList.where((todo) => todo.isDone == true).toList();

  bool toggleStatusesList(Model model) {
    model.isDone = !model.isDone;
    notifyListeners();
    return model.isDone;
  }
}
