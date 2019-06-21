import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopMenuBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      automaticallyImplyLeading: true,
      title: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/logofull.png"),
          width: MediaQuery.of(context).size.width/3.2,
        ),
      ),
      backgroundColor: Color(0xff232882),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.sync,
            color: Colors.white,
          ),
          tooltip: 'Sync',
        )
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(55.0);
}
