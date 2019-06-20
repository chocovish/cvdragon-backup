import 'package:flutter/material.dart';
import './const.dart';
List data;
class CustomDialogKeyPhrases extends StatelessWidget {
  String title="";

  CustomDialogKeyPhrases(String t,List d){
    this.title=t;
    data=d;

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
            padding: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height / 1.95,
              child: Scrollbar(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return RaisedButton(
                    color: Color(0xff232882),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      data[index]['keyitem'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              
            ),
          ),
          ),
          Container(
            height: 35,
            //width3 40,

            alignment: FractionalOffset.bottomCenter,
            child: RaisedButton(
              color: Color(0xff232882),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Okay",
                
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
