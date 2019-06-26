import 'package:flutter/material.dart';
import './const.dart';

List data;

class CustomDialogDatabase extends StatelessWidget {
  String title = "";

  CustomDialogDatabase(String t) {
    this.title = t;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      //alignment: FractionalOffset.center,
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        top: Consts.padding,
        //bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      //margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            alignment: FractionalOffset.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/1.85,
            child:ListView(children: <Widget>[Card(
              child: Column(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.all(5.0),
                    child: Text(
                        "sbgbvsgbkrjbjzgszljirwgbwiobgrbgobowbosrsgobosrbpgsbobspbsgp"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: FractionalOffset.bottomLeft,
                        padding: EdgeInsets.only(
                            left: 10.0, top: 10.0, bottom: 10.0),
                        child: InkWell(
                          child: Container(
                            alignment: FractionalOffset.centerLeft,
                            padding: EdgeInsets.only(left: 11.0),
                            height: MediaQuery.of(context).size.height / 22,
                            width: MediaQuery.of(context).size.width / 4,
                            //alignment: FractionalOffset.bottomRight,
                            decoration: BoxDecoration(
                                color: Color(0xff232882),
                                borderRadius: BorderRadius.circular(30.0),
                                border: new Border.all(color: Colors.white)),
//                                            child: Padding(
//                                              padding: const EdgeInsets.only(top: 1.0),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Icon(Icons.add_circle,
                                        size: MediaQuery.of(context)
                                            .size
                                            .aspectRatio *
                                            35.0,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            )],),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 20,
            alignment: FractionalOffset.center,
            child: RaisedButton(
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Okay",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
