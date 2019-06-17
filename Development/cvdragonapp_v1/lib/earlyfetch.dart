import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart' as sfetch;

String id = "15585932569410";
String authkey = "1d9f7dba5fa41c8065f198f97cd177f9";
List datafrmserver;
Database database;

class DatabaseFetch {
  initialize() async {
    print('initialized called');
    await openDatabase("assets/sections.db", version: 1,
        onOpen: (Database db) async {
      List<String> queries = [
        "CREATE TABLE `cv-academic-projects` (  `academicid` int(11) NOT NULL,  `id` bigint(20) NOT NULL,  `title` varchar(100) NOT NULL,  `description` text NOT NULL,  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` int(11) NOT NULL,  `proofReadDate` date NOT NULL,  `status` smallint(1) NOT NULL);",
        "CREATE TABLE  `cv-achievements`(`achieveid` int(11) NOT NULL, `id` bigint(20) NOT NULL,`achievement` varchar(255) NOT NULL,  `year` year(4) NOT NULL,  `description` text NOT NULL,`created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  `proofRead` tinyint(4) NOT NULL, `proofReadDate` date NOT NULL,`status` tinyint(1) NOT NULL);"
      ];
      queries.forEach((element) async {
        await db.execute(element.toString()).then((void onvalue){
            print(queries.indexOf(element));
        }
        );
      });
      sfetch.writealltablescreated(true);
    });
  }

  add() async {
    await openDatabase("assets/sections.db", version: 1,
        onOpen: (Database db) async {
          await fetch.getcvAchievement(id, authkey).then((List acheievements){
              acheievements.forEach((element){
                db.insert("`cv-achievements`",element);
              print(element);
              }
              );
          });
        
    });
  }

  display() async {
    print('display called');
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'assets/sections.db');
    await openDatabase('assets/sections.db', version: 3,
        onOpen: (Database db) async {
      print(await db.rawQuery("SELECT * FROM `cv-achievements`"));
      print('execute');
    });
  }

  DatabaseFetch() {
    
    sfetch.readalltablescreated().then((bool status){
     if(status==false)
      initialize();
    else
      display();
     //add();
    // print(status);
    fetch.getSectionData().then((List data) {
      datafrmserver = data;
      print("datafrmserver");
    });
    fetch.getbasicInfo(id, authkey).then((Map<String, dynamic> basicData) {
      sfetch.writename(basicData['fullName']);
      sfetch.writemail(basicData['emailAddress']);
    });
    });
  }
}
