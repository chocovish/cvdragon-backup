import 'package:cvdragonapp_v1/fetch.dart';
import 'package:cvdragonapp_v1/sharedfetch.dart';
import 'package:flutter/material.dart';
List profiles;
String id="";
String authkey="";

class ProfileSelector extends StatefulWidget
{
  ProfileSelector(String i,String a)
  {
    id=i;
    authkey=a;
  }
  @override
  _ProfileSelectorState createState() => _ProfileSelectorState();
}

class _ProfileSelectorState extends State<ProfileSelector> {
  write(String cvid) async
  {
      await writeprofile(cvid);
  }
  @override
  void initState() {
   
    super.initState();
   get();
  }
  void get() async
  {
    profiles=await getcvProfiles(id, authkey);
  }
  @override
  Widget build(BuildContext context) {
    
    return Dialog(
      child: dialogContent(context,write),

    );
  }
}

Widget dialogContent(BuildContext context,write)
{
  return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: profiles == null ? 0 : profiles.length,
                itemBuilder: (BuildContext context, int index) {
                  return RaisedButton(
                    color: Color(0xff232882),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){
                      write(profiles[index]['cvid'].toString());
                    },
                    child: Text(
                     profiles[index]['profileName'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                },
              
    );
}