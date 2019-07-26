import 'package:flutter/material.dart';
import './bottombar_home.dart';



class MybottomNav extends StatelessWidget {
  int selectedPage = 3;
  MybottomNav(this.selectedPage);
  @override
  Widget build(BuildContext context) {

    return FABBottomAppBar(
              selectedPage: selectedPage,
              onTabSelected: (int i){
                selectedPage=i;
              },
              notchedShape: CircularNotchedRectangle(),
              color: Colors.white30,
              centerItemText: "Preview",
              backgroundColor: Color(0xff232882),
              selectedColor: Colors.white,
              items: [
                FABBottomAppBarItem(
                    iconData: Icons.import_contacts, text: 'Knowledge'),
                FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
                FABBottomAppBarItem(
                    iconData: Icons.swap_vert, text: 'Profiles'),
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
              ],
            );
  }
}