<<<<<<< HEAD
import './design_drawer.dart';
import 'package:cvdragonapp_v1/design_drawer.dart';
=======
>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


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

<<<<<<< HEAD
int _selectedIndex=2;
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if(index==1)
    {
      
      _scaffoldKey.currentState.openDrawer();
    } 
  });
=======
  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 2;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    // TODO: implement build
    return  Scaffold(
    key: _scaffoldKey,
    drawer: Drawer(
    child: DesignDrawer(),
    ),
    
      bottomNavigationBar:BottomNavigationBar(
      iconSize: 35.0,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mode_edit),
          title: Text('Designs'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_downward),
          title: Text('Download'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          title: Text('Sections'),
=======
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
>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
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
<<<<<<< HEAD
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff232882),
      backgroundColor: Colors.white, 
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
      ),
      
    
      );
    
=======
      ),
    );
>>>>>>> 6e0d48fe4e29378d725e2c87af7d57db49535c90
  }
}
