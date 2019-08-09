import 'package:flutter/material.dart';
import './bottombar_home.dart';
import './profile_sections.dart';
import './knowledge_centre.dart';
import './myprofiles.dart';

class MybottomNav extends StatelessWidget {
  final int selectedPage;
  final String centerItemText;
  MybottomNav([this.selectedPage,this.centerItemText]);
  @override
  Widget build(BuildContext context) {

    return FABBottomAppBar(
              selectedPage: selectedPage??3,
              onTabSelected: _updateIndex,
              notchedShape: CircularNotchedRectangle(),
              color: Colors.white30,
              centerItemText: centerItemText??"Preview",
              backgroundColor: Color(0xff232882),
              selectedColor: Colors.white,
              items: [
                FABBottomAppBarItem(
                    iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
                FABBottomAppBarItem(
                    iconData: Icons.swap_vert, text: 'Profiles'),
                FABBottomAppBarItem(iconData: Icons.import_contacts, text: 'Knowledge'),
              ],
            );
  }
}



_updateIndex(BuildContext context,int index, int selectedIndex) {

    //widget.onTabSelected(index);
    print("got index value $index");
    print("got selectedIndex value $selectedIndex");
    if(selectedIndex!=index) {
  
        if (index == 1) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ProfileSections();
              }
              )
          );
        }
        else if (index==2) {
          //writeprofile(null);
         Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return MyProfiles();
              }
              )
          );
        }
        else if (index==0){
          Navigator.of(context).popUntil((Route route){
            return route.isFirst;
          });
        }
        else if (index == 3) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return Knowledge();
              }
              )
          );
        }

        selectedIndex = index;
      
    }
  }