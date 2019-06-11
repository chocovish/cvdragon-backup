import 'package:flutter/material.dart';
import './myprofiles.dart';
import './coverletters.dart';
import './institute.dart';
import './publicprofile.dart';
import './sections.dart';
class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SideMenu();
  }
}
//create a list for the list items
class _SideMenu extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      elevation: 2,
      child: ListView(
        children: <Widget>[
          Row(children: <Widget>[],),
          UserAccountsDrawerHeader(
            accountName: Text("My dragon"),
            accountEmail: Text("rohitagarwal17800@gmail.com"),
            currentAccountPicture: CircleAvatar(backgroundColor: Colors.white,),
            otherAccountsPictures: <Widget>[Icon(Icons.edit,color: Colors.white,)],
            ),
          ListTile(
            title: Text('My Profiles',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            leading: Icon(Icons.supervised_user_circle,size: 40,),
            subtitle: Text('Check your Profiles'),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              setState(() {

              Navigator.pop(context); 
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyProfiles()));  
              });
              
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Sections',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            leading: Icon(Icons.edit,size: 40,),
            subtitle: Text('View your sections'),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Sections()));
              
            },
          ),
          Divider(),
          ListTile(
            title: Text('Cover Letters',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            leading: Icon(Icons.crop_rotate,size: 40,),
            subtitle: Text('Check your Cover Letters'),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  CoverLetters()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Institute',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            leading: Icon(Icons.home,size: 40,),
            subtitle: Text('My Institute Details'),
            trailing: Icon(Icons.arrow_right),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Institutes()));
            },
          ),
          Divider(),
          ListTile(
            title: Text('Public Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.supervised_user_circle,size: 40,),
            subtitle: Text('View Your Public Profile'),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  PublicProfile()));
            },
          ),
          
          Divider(),
        ListTile(),ListTile(),ListTile(),
          Row(
            children: <Widget>[
            Expanded(child: Column(children: <Widget>[IconButton(icon: Icon(Icons.info,size: 20.0,color: Color(0xff232822),),tooltip: 'About',),Text('About',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10),)],),),
             Expanded(child: Column(children: <Widget>[IconButton(icon: Icon(Icons.accessible,size: 20.0,color: Color(0xff232822),),tooltip: 'Terms',),Text('Terms',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10))],),),
             Expanded(child: Column(children: <Widget>[IconButton(icon: Icon(Icons.apps,size: 20.0,color: Color(0xff232822)),tooltip: 'Privacy',),Text('Privacy',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10))],),),
             Expanded(child: Column(children: <Widget>[IconButton(icon: Icon(Icons.link_off,size: 20.0,color: Color(0xff232822)),tooltip: 'Logout',),Text('Logout',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 10))],),),
            ],
          )
        ],
      
      ),
    );
  }
}
