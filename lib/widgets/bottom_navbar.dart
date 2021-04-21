import 'package:flutter/material.dart';
import 'package:flutter_app_alif/generated/l10n.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;

  const BottomNavBar({Key key, this.selectedIndex, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
      unselectedLabelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
      elevation: 5,
      backgroundColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.fact_check_outlined,
            color: Colors.amber,
          ),
          label: "Todos",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pending,
            color: Colors.amber,
          ),
          label: 'Pending',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.check,
            color: Colors.amber,
          ),
          label: 'Complete',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      onTap: onTap,
    );
  }
}
