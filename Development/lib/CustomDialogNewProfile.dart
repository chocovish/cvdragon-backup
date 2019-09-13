import 'package:cvdragonapp_v1/maps.dart';
import 'package:flutter/material.dart';
import './const.dart';

class CustomDialogNewProfile extends StatelessWidget {
  final String title, buttonText,sectionId;
  final List description;
  List selectedsubs=[];

  CustomDialogNewProfile({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.sectionId,

  });
final addit = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    selectedsubs=[];
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
      height: MediaQuery.of(context).size.height/1.5,
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
        children:<Widget>[
        Container(
          height: MediaQuery.of(context).size.height/18,
          alignment: FractionalOffset.center,
          child:
              Row(
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
                height: MediaQuery.of(context).size.height/1.9,
                child:
              ListView(
                physics: BouncingScrollPhysics(),
                  children:<Widget>[
              Container(
                height: MediaQuery.of(context).size.height/1.9,
                //decoration: BoxDecoration(border: Border.all(color: Color(0xff232882))),
                alignment: FractionalOffset.topCenter,
                padding: EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: description == null ? 0 : description.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: <Widget>[
                      RaisedButton(
                        color: Color(0xff232882),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        onPressed: () {
                          //Navigator.of(context).pop();
                        },
                        child: Text(
                          description[index][AddedDataColumn[sectionId]].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: addit,
                        builder: (context, val, child) {
                      return Checkbox(
                        value: val,
                        onChanged: (c)
                        {
                            addit.value = c;
                          selectedsubs.add( description[index]['refID'].toString());
                        },
                      );
                        }
                  )
                    ],
                  );
                },
              
            ),
              ),
          ]
              ),
              ),

          Container(
            height: MediaQuery.of(context).size.height/16,
            alignment: FractionalOffset.center,
            child: RaisedButton(color: Colors.pink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              onPressed: () {
                // np.datatobesent[sectionId]=selectedsubs;
                Navigator.of(context).pop();
              },
              child: Text(
                buttonText,
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