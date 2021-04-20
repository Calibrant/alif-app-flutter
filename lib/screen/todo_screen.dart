import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_alif/generated/l10n.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/utilities/db_helper.dart';
import 'package:flutter_app_alif/widgets/bottom_navbar.dart';
import 'package:flutter_app_alif/widgets/const.dart';
import 'post_item.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  List<Model> _todoList = null;
  int count = 0;
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    int count = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      populateListView(),
      populateListView2(),
      populateListView3(),
    ];

    if (_todoList == null) {
      _todoList = [];
      updateListView();
    }
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(S.of(context).app_bar_title)),
        actions: [
          IconButton(
            tooltip: S.of(context).tool_tip,
            padding: EdgeInsets.only(right: 50.0),
            icon: Icon(
              Icons.add,
              size: 40.0,
            ),
            onPressed: () {
              navigateToDetail(
                  Model(S.of(context).space, S.of(context).space,
                      S.of(context).space, S.of(context).space),
                  S.of(context).button_add_new_item);
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  ListView populateListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this._todoList[index];
          return Card(
            elevation: 5,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                navigateToDetail(model, S.of(context).button_update_item);
              },
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text(model.title),
                subtitle: Text(model.description),
                trailing: Wrap(
                  spacing: 20.0,
                  children: [
                    model.status == S.of(context).model_status_pending
                        ? Icon(
                            Icons.pending_actions,
                            color: Colors.blue,
                          )
                        : Icon(Icons.done_all),
                    GestureDetector(
                      child: Icon(Icons.delete, color: Colors.red),
                      onTap: () {
                        deleteItem(model);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  ListView populateListView2() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this._todoList[index];
          return model.status == S.of(context).model_status_pending
              ? Card(
                  elevation: 5,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      navigateToDetail(model, S.of(context).button_update_item);
                    },
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(model.title),
                      subtitle: Text(model.description),
                      trailing: Wrap(
                        spacing: 20.0,
                        children: [
                          model.status == S.of(context).model_status_pending
                              ? Icon(
                                  Icons.pending_actions,
                                  color: Colors.blue,
                                )
                              : Icon(Icons.done_all),
                          GestureDetector(
                            child: Icon(Icons.delete, color: Colors.red),
                            onTap: () {
                              deleteItem(model);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink();
        });
  }

  ListView populateListView3() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this._todoList[index];
          return model.status == S.of(context).model_status_pending
              ? SizedBox.shrink()
              : Card(
                  elevation: 5,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      navigateToDetail(model, S.of(context).button_update_item);
                    },
                    child: ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(model.title),
                      subtitle: Text(model.description),
                      trailing: Wrap(
                        spacing: 20.0,
                        children: [
                          model.status == S.of(context).model_status_pending
                              ? Icon(Icons.pending_actions)
                              : Icon(Icons.done_all, color: Colors.green),
                          GestureDetector(
                            child: Icon(Icons.delete, color: Colors.red),
                            onTap: () {
                              deleteItem(model);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }

  updateListView() async {
    _todoList = await dataBaseHelper.getModelsFromMapList();
    setState(() {
      _todoList = _todoList;
      count = _todoList.length;
    });
  }

  deleteItem(Model toDoModel) async {
    int result = await dataBaseHelper.delete(toDoModel);
    if (result != 0) {
      _globalKey.currentState
          .showSnackBar(SnackBar(content: Text(S.of(context).snack_bar_text)));
      updateListView();
    }
  }

  navigateToDetail(Model model, String appBarTitle) async {
    bool results =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostItem(model, appBarTitle);
    }));
    if (results) {
      // update the list
      updateListView();
    }
  }
}
