import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_alif/generated/l10n.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/utilities/constants.dart';
import 'package:flutter_app_alif/utilities/db_helper.dart';
import 'package:flutter_app_alif/widgets/bottom_navbar.dart';
import 'post_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                // image: DecorationImage(image: AssetImage("images/todoicons.png"),),
              ),
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

  ListView populateListView() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this._todoList[index];
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    navigateToDetail(model, S.of(context).button_update_item);
                  },
                  caption: S.of(context).caption_edit,
                  icon: Icons.edit,
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  color: Colors.red,
                  caption: S.of(context).caption_delete,
                  onTap: () {
                    deleteItem(model);
                  },
                  icon: Icons.delete,
                ),
              ],
              child: Card(
                elevation: 5,
                color: Theme.of(context).cardColor,
                child: ListTile(
                  title: Text(
                    model.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(model.description),
                  trailing: Wrap(
                    spacing: 20.0,
                    children: [
                      model.status == S.of(context).model_status_pending
                          ? Icon(
                              Icons.pending_actions,
                              color: Theme.of(context).iconTheme.color, //blue
                            )
                          : Icon(
                              Icons.done_all,
                              color: Theme.of(context).accentColor,
                              //green
                            ),
                    ],
                  ),
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
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    navigateToDetail(model, S.of(context).button_update_item);
                  },
                  caption: S.of(context).caption_edit,
                  icon: Icons.edit,
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  color: Colors.red,
                  caption: S.of(context).caption_delete,
                  onTap: () {
                    deleteItem(model);
                  },
                  icon: Icons.delete,
                ),
              ],
              child: model.status == S.of(context).model_status_pending
                  ? Card(
                      elevation: 5,
                      color: Theme.of(context).cardColor,
                      child: ListTile(
                        title: Text(
                          model.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(model.description),
                        trailing: Wrap(
                          spacing: 20.0,
                          children: [
                            model.status == S.of(context).model_status_pending
                                ? Icon(
                                    Icons.pending_actions,
                                    color: Theme.of(context)
                                        .iconTheme
                                        .color, //blue
                                  )
                                : Icon(
                                    Icons.done_all,
                                    color:
                                        Theme.of(context).accentColor, //green
                                  ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
            ),
          );
        });
  }

  ListView populateListView3() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this._todoList[index];
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    navigateToDetail(model, S.of(context).button_update_item);
                  },
                  caption: S.of(context).caption_edit,
                  icon: Icons.edit,
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  color: Colors.red,
                  caption: S.of(context).caption_delete,
                  onTap: () {
                    deleteItem(model);
                  },
                  icon: Icons.delete,
                ),
              ],
              child: model.status == S.of(context).model_status_pending
                  ? SizedBox.shrink()
                  : Card(
                      elevation: 5,
                      color: Theme.of(context).cardColor,
                      child: ListTile(
                        title: Text(
                          model.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(model.description),
                        trailing: Wrap(
                          spacing: 20.0,
                          children: [
                            model.status == S.of(context).model_status_pending
                                ? Icon(
                                    Icons.pending_actions,
                                    color: Theme.of(context)
                                        .iconTheme
                                        .color, //blue
                                  )
                                : Icon(
                                    Icons.done_all,
                                    color:
                                        Theme.of(context).accentColor, //green
                                  ),
                          ],
                        ),
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