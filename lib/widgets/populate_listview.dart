import 'package:flutter/material.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/provider/todos.dart';
import 'package:flutter_app_alif/screen/post_item.dart';
import 'package:provider/provider.dart';

class PopulateListView extends StatelessWidget {
  final Function deleteItem;
  final Function navToDetail;
  final List<Model> todoList;
  final Widget listTile;
  PopulateListView(
      {Key key,
      this.deleteItem,
      this.todoList,
      @required this.navToDetail,
      this.listTile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<TodosProvider>(context).count,
        itemBuilder: (context, index) {
          Model model = Provider.of<TodosProvider>(context).buildBody(
              context, index, Provider.of<TodosProvider>(context).model);
          return Card(
            elevation: 1,
            color: Colors.white,
            child: GestureDetector(
              onTap: navToDetail,
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text(model.title),
                subtitle: Text(model.description),
                trailing: Wrap(
                  spacing: 20.0,
                  children: [
                    model.status == "Pending"
                        ? Icon(Icons.warning, color: Colors.blue)
                        : Icon(Icons.done_all, color: Colors.green),
                    GestureDetector(
                      child: Icon(Icons.delete, color: Colors.grey),
                      onTap:
                          deleteItem, /* () {
                        deleteItem(Provider.of<TodosProvider>(context, listen: false).model);
                      } */
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
