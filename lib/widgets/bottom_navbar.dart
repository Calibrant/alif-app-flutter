import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function onTap;

  const BottomNavBar({Key key, this.selectedIndex, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
        unselectedLabelStyle: TextStyle(color: Colors.white, fontSize: 16.0),
        elevation: 5,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.fact_check_outlined,color: Colors.white,),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending,color: Colors.white,),
            label: 'Pending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check,color: Colors.white,),
            label: 'Complete',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: onTap,
      );
  }
}