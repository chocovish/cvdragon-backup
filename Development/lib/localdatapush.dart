import 'package:cvdragonapp_v1/datapush.dart';
import 'package:cvdragonapp_v1/maps.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io' as io;
import './sharedfetch.dart' as sfetch;
import 'package:cvdragonapp_v1/datapush.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './earlyfetch.dart';
import './datapush.dart' as server;
var id = '';
var authkey = '';
var cvid = '';
//var sectionID = '51122';
//var data = 'projects';
 

Future<int>pushData(String section,Map<String,dynamic> createddata) async{
   var add =await getApplicationDocumentsDirectory();
      var timestamp=new DateTime.now().millisecondsSinceEpoch;
      id=await sfetch.readid();
      authkey=await sfetch.readauthKey();
      cvid= await sfetch.readprofiles();
      var db=await openDatabase(add.path+"/sections.db", version: 1);
      
      Map<String, dynamic> contents = {
        'id':id,
        'refID':timestamp,
        columnName[section]:timestamp,
        'status':1,
        'proofRead':0,
        'proofReadDate':"0000-00-00"
};
print(createddata);
contents.addAll(createddata);

        await db.insert(tablename[section],contents);
        await db.rawUpdate("UPDATE `create-cvsection` SET contentAdded = contentAdded+1, status=1 WHERE id="+id+" AND section="+section+" AND status=1");
        String serversend=await  server.addData(timestamp.toString(),section,contents);
        print(serversend);
        // insert a subsection the arrays of create-cvprofilesection => in subsection
        List response=await db.rawQuery("SELECT subsection FROM `create-cvprofilesection` WHERE `cvid`= "+cvid+" AND `section` = "+section);
        print(response.toString());
        List res=[];
        if(response[0]['subsection'].toString()!="")
        {
        res=json.decode(response[0]['subsection']);
        res.add(timestamp);
        }
        else
        {
          res.add(timestamp);
        }
        String sql="UPDATE `create-cvprofilesection` SET subsection=\""+res.toString()+"\" WHERE `cvid`= "+cvid+" AND `section` = "+section;
        await db.rawUpdate(sql);
        print("Added a data in local data fetch");
        return 1;

        
}

Future<int>updateData(String section,Map<String,dynamic> newdata,Map<String,dynamic> data) async{
   var add =await getApplicationDocumentsDirectory();
var db=await openDatabase(add.path+"/sections.db", version: 1);
id=await sfetch.readid();
String sql="UPDATE "+tablename[section]+" SET ";
newdata.forEach((k,v){
  v=v.toString();
  print(k+" : "+v);
  sql+=k+" = \""+v+"\",";
});
sql=sql.substring(0,sql.length-1);
sql+=" WHERE id="+id+" AND "+columnName[section]+"="+data[columnName[section]].toString();
        await db.rawUpdate(sql);
        String serverupdate=await server.editData(data['refID'].toString(), section, newdata);
        print(serverupdate);
        return 1;
}
