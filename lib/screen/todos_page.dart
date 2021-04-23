import 'package:flutter/material.dart';
import 'package:flutter_app_alif/generated/l10n.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/provider%20pattern/todos.dart';
import 'package:flutter_app_alif/utilities/constants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodosPage extends StatelessWidget {
  final int count;
  final Function navigateDetail;
  final Function deleteItem;
  final List<Model> todoList;

  const TodosPage(
      {Key key,
      this.count,
      this.todoList,
      this.navigateDetail,
      this.deleteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          Model model = this.todoList[index];
          Provider.of<TodosProvider>(context).model = model;
          return ClipRRect(
            borderRadius: kBorderRadius,
            child: Slidable(
              actionPane: SlidableDrawerActionPane(),
              actions: [
                IconSlideAction(
                  color: Theme.of(context).primaryColor,
                  onTap: navigateDetail,
                  caption: S.of(context).caption_edit,
                  icon: Icons.edit,
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  color: Theme.of(context).primaryIconTheme.color,
                  caption: S.of(context).caption_delete,
                  onTap: deleteItem,
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
                  ,
            ),
          );
        });
  }
}