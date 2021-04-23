import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_alif/generated/l10n.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/provider%20pattern/todos.dart';
import 'package:flutter_app_alif/utilities/db_helper.dart';
import 'package:flutter_app_alif/widgets/bottom_navbar.dart';
import 'package:flutter_app_alif/widgets/completed_page.dart';
import 'package:flutter_app_alif/widgets/pending_page.dart';
import 'package:flutter_app_alif/widgets/todos_page.dart';
import 'package:provider/provider.dart';
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
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      TodosPage(
        count: count,
        todoList: _todoList,
        navigateDetail: () {
          navigateToDetail(
              Provider.of<TodosProvider>(context, listen: false).model,
              S.of(context).button_update_item);
        },
        deleteItem: () {
          deleteItem(Provider.of<TodosProvider>(context, listen: false).model);
        },
      ),
      PendingPage(
        count: count,
        todoList: _todoList,
        navigateDetail: () {
          navigateToDetail(
              Provider.of<TodosProvider>(context, listen: false).model,
              S.of(context).button_update_item);
        },
        deleteItem: () {
          deleteItem(Provider.of<TodosProvider>(context, listen: false).model);
        },
      ),
      CompletedPage(
        count: count,
        todoList: _todoList,
        navigateDetail: () {
          navigateToDetail(
              Provider.of<TodosProvider>(context, listen: false).model,
              S.of(context).button_update_item);
        },
        deleteItem: () {
          deleteItem(Provider.of<TodosProvider>(context, listen: false).model);
        },
      ),
    ];

    if (_todoList == null) {
      _todoList = [];
      updateListView();
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      key: _globalKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: Theme.of(context).accentIconTheme,
        title: Center(
            child: Text(
          S.of(context).app_bar_title,
          style: Theme.of(context).primaryTextTheme.headline6,
        )),
        actions: [
          IconButton(
            tooltip: S.of(context).tool_tip,
            padding: EdgeInsets.only(right: 50.0),
            icon: Icon(
              Icons.add,
              size: 40.0,
              color: Theme.of(context).cardColor,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Todo list',
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                  Text('alisher1705@gmail.com',
                      style: Theme.of(context).primaryTextTheme.subtitle1),
                ],
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
