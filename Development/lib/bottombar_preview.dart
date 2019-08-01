import './fonts.dart';
import 'package:flutter/material.dart';
import './home.dart';
import './designs.dart';
import './Design_Sections.dart';
import './profile_sections.dart';
import './Colors.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});

  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 4);
  }

  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

 @override
 State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 5;

 _updateIndex(int index) {
   widget.onTabSelected(index);
      if(index == 2) {
        Navigator.of(context).push(
            MaterialPageRoute<Null>(builder: (BuildContext context) {
              return ProfileSections();
            }
            )
        );
      }

      if(index == 3) {
      //  Navigator.of(context).push(
      //      MaterialPageRoute<Null>(builder: (BuildContext context) {
      //        return Colorset();
      //      }
      //      ));
      }
       if(index == 1) {
       Navigator.of(context).push(
           MaterialPageRoute<Null>(builder: (BuildContext context) {
             return CVFont();
           }
           ));
           }
          
      
      //   await showMenu<String>(
      //     context: context,
      //     position: RelativeRect.fromLTRB(500.0, 1000.0, 0.0, 0.0),
      //     items: <PopupMenuItem<String>>[
      //       new PopupMenuItem<String>(
      //           child: const Text('Proof Read'), value: 'test1',),
      //       new PopupMenuItem<String>(
      //           child: const Text('Colors'), value: 'test2'),
      //       new PopupMenuItem<String>(
      //           child: const Text('Fonts'), value: 'test2'),
      //       new PopupMenuItem<String>(
      //           child: const Text('Advanced Setting'), value: 'test2'),
      //     ],
      //     elevation: 8.0,

      //  );
      // }

     if(index == 0) {
       Navigator.of(context).push(
           MaterialPageRoute<Null>(builder: (BuildContext context) {
             return HomePagee();
           }
           )
       );
     }
    //  if(index == 1){
      
    //    Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context){
    //     return Designs();
    //     }
    //   )
    // );
    //   }
      _selectedIndex = index;
   
   
 }

 @override
 Widget build(BuildContext context) {
   List<Widget> items = List.generate(widget.items.length, (int index) {
     return _buildTabItem(
       item: widget.items[index],
       index: index,
       onPressed: _updateIndex,
     );
   });
   items.insert(items.length >> 1, _buildMiddleTabItem());

   return BottomAppBar(
     shape: widget.notchedShape,
     child: Row(
       mainAxisSize: MainAxisSize.max,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: items,
     ),
     color: widget.backgroundColor,
   );
 }

 Widget _buildMiddleTabItem() {
   return Expanded(
     child: SizedBox(
       height: widget.height,
       child: Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           SizedBox(height: widget.iconSize),
           Text(
             widget.centerItemText ?? '',
             style: TextStyle(color: Colors.pinkAccent),
           ),
         ],
       ),
     ),
   );
 }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
