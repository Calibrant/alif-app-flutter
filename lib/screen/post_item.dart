import 'package:flutter/material.dart';
import 'package:flutter_app_alif/generated/l10n.dart';
import 'package:flutter_app_alif/models/model.dart';
import 'package:flutter_app_alif/utilities/db_helper.dart';
import 'package:intl/intl.dart';

class PostItem extends StatefulWidget {
  Model model;
  String appBarTitle;
  PostItem(this.model, this.appBarTitle);
  @override
  _PostItemState createState() => _PostItemState(this.model, this.appBarTitle);
}

class _PostItemState extends State<PostItem> {
  Model model;
  String appBarTitle;

  var _statusesList = [
    S.current.model_status_pending,
    S.current.model_status_completed
  ];
  var selectedStatus = S.current.model_status_pending;

  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  _PostItemState(this.model, this.appBarTitle);

  DateTime _dateTime = DateTime.now();
  var myFormat = DateFormat(S.current.date_format);

  @override
  void initState() {
    selectedStatus = model.status.length == 0
        ? S.current.model_status_pending
        : model.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _titleEditingController.text = model.title;
    _dateController.text = model.description;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            DropdownButton(
                value: selectedStatus,
                items: _statusesList.map((item) {
                  return DropdownMenuItem(child: Text(item), value: item);
                }).toList(),
                onChanged: (item) {
                  setState(() {
                    selectedStatus = item;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _titleEditingController,
              decoration: InputDecoration(
                  hintText: S.of(context).text_field_text,
                  labelText: S.of(context).text_field_title,
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_dateTime == null
                    ? S.of(context).date_nothing_selected
                    : //DateFormat.yMMMMEEEEd().format(DateTime.now())),
                    //  DateFormat.yMMMd().format(DateTime.now())),
                    _dateTime.toString()),
                ElevatedButton(
                  child: Text(S.of(context).button_pick_date),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate:
                                _dateTime == null ? DateTime.now() : _dateTime,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2050))
                        .then((date) {
                      setState(() {
                        model.title = _titleEditingController.text;
                        _dateTime = date;
                        model.description =
                            myFormat.format(date); //_dateTime.toString();
                      });
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  validate();
                },
                child: Text(
                  appBarTitle,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  validate() {
    model.title = _titleEditingController.text;
    model.description = _dateController.text;
    model.status = selectedStatus;
    model.date = _dateTime.toString();
    DataBaseHelper dataBaseHelper = DataBaseHelper();
    if (model.id == null)
      dataBaseHelper.insert(model);
    else
      dataBaseHelper.updateItem(model);
    Navigator.pop(context, true);
  }
}
