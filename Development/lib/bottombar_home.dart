import 'package:cvdragonapp_v1/CardView_NewProfile.dart';
import 'package:flutter/material.dart';
import './profile_sections.dart';
import './CardView_NewProfile.dart';
import './knowledge_centre.dart';
import './Expanded_Profile.dart';

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
    this.selectedPage: 3,
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
  final int selectedPage;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 3;
  @override
  @override
  void initState() { 
    super.initState();
    print("printing from initstate");
    
  }

  _updateIndex(int index) {

    //widget.onTabSelected(index);
    print("got index value $index");
    print("got selectedIndex value $_selectedIndex");
    if(_selectedIndex!=index) {
      setState(() {
        if (index == 1) {
          Navigator.of(context).push(
              MaterialPageRoute<Null>(builder: (BuildContext context) {
                return ProfileSections();
              }
              )
          );
        }
        else if(index == 2)
        {
              Navigator.of(context).push(
              MaterialPageRoute<Null>(builder: (BuildContext context) {
                return CardProfiles();
              }
              )
          );
        }
        else if (index==3){

        }
        else if (index == 0) {
          Navigator.of(context).push(
              MaterialPageRoute<Null>(builder: (BuildContext context) {
                return Knowledge();
              }
              )
          );
        }

        _selectedIndex = index;
      }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _selectedIndex = widget.selectedPage;
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
                  style: TextStyle(color: color,fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
