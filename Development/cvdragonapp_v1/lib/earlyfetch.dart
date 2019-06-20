import 'dart:async';
import 'dart:io' as io;
import './listofcreatequeries.dart';
import 'package:sqflite/sqflite.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart' as sfetch;

String id = "15585932569410";
String authkey = "1d9f7dba5fa41c8065f198f97cd177f9";
List datafrmserver;
Database database;
Future <void>initialize() async {
    print('initialized called');
    await openDatabase("assets/sections.db", version: 1,
        onOpen: (Database db) async {
      List<String>queries=createQueries;
      queries.forEach((element) async {
        await db.execute(element.toString()).then((void onvalue) {
          print(queries.indexOf(element));
        });
      });
      sfetch.writealltablescreated(true);
    });
  }

  Future <void> add() async {
    await openDatabase("assets/sections.db", version: 1,
        onOpen: (Database db) async {
      await fetch.getcvProject(id, authkey).then((List acheievements) {
        acheievements.forEach((element) {
          print(element);
          db.insert("`cv-project`", element);
          print("Added1");
        });
      });
      await fetch.getcvSection(id, authkey).then((List cvsections) {
        cvsections.forEach((element) {
          db.insert("`create-cvsection`", element);
          print("Added2");
        });
      });
      await fetch.getcvProfileSection(id, authkey).then((List cvprofilesections) {
        cvprofilesections.forEach((element) {
          db.insert("`create-cvprofilesection`", element);
          print("Added3");
        });
      });
    });
  }

  display() async {
    print('This display called');
    await openDatabase('assets/sections.db', version: 3,
        onOpen: (Database db) async {
          print(await db.rawQuery("SELECT title FROM `cv-project`"));
      print(await db.rawQuery("SELECT * FROM `create-cvsection` WHERE section=51105"));
      // DataPush();
      print('execute');
    });
  }
class DatabaseFetch {
  

  DatabaseFetch() {
    sfetch.readalltablescreated().then((bool status) {
      if (status == true)
        {
        display();
        }
        else{
          initialize();
        }
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
