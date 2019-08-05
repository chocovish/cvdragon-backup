import 'package:cvdragonapp_v1/sync.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './Notifiers.dart';

class TopMenuBar extends StatelessWidget with PreferredSizeWidget {
  everythingSynced(BuildContext context) {
    CupertinoAlertDialog d = CupertinoAlertDialog(
      content: Text("Everything is synchronized properly"),
      actions: <Widget>[
        CupertinoButton(
          child: Text("Great!"),
          onPressed: Navigator.of(context).pop,
        )
      ],
    );

    showCupertinoDialog(context: context, builder: (_) => d);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Container(
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/logofull.png"),
          width: MediaQuery.of(context).size.width / 3.2,
        ),
      ),
      backgroundColor: Colors.black,
      actions: <Widget>[
        ValueListenableBuilder(
          valueListenable: syncOnGoing,
          builder: (context, loading, child) => loading
              ? Padding(
                  padding: EdgeInsets.only(right: 14),
                  child: CupertinoActivityIndicator(),
                )
              : ValueListenableBuilder(
                  valueListenable: syncNotifier,
                  builder: (context, shouldUpdate, child) => !shouldUpdate
                      ? IconButton(
                          onPressed: () {
                            everythingSynced(context);
                          },
                          icon: Icon(
                            Icons.done_outline,
                            color: Colors.green,
                            size: 14,
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            syncthedata(context);
                          },
                          icon: Icon(
                            Icons.sync,
                            color: Colors.yellow,
                          ),
                          tooltip: 'Sync',
                        ),
                ),
        )
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(55.0);
}
