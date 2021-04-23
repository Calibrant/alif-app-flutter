import 'package:flutter/material.dart';

class DrawerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
          ),
        ],
      ),
    );
  }
}
