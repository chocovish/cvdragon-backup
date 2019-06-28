import 'dart:async';
import 'dart:io' as io;
import 'package:cvdragonapp_v1/datapush.dart';

import './listofcreatequeries.dart';
import 'package:sqflite/sqflite.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart' as sfetch;

String id = "15585932569410";
String authkey = "1d9f7dba5fa41c8065f198f97cd177f9";
List datafrmserver;
Database database;
Future<String> initialize() async {
  print('initialized called');
  await openDatabase("assets/sections.db", version: 1,
      onOpen: (Database db) async {
    List<String> queries = createQueries;
    queries.forEach((element) async {
      await db.execute(element.toString()).then((void onvalue) {
        print(queries.indexOf(element));
      });
    });
    sfetch.writealltablescreated(true);
    return "Tables created";
  });
}

Future<void> add() async {
  var db = await openDatabase("assets/sections.db", version: 1);
  await fetch.getcvProject(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-project`", element);
      print("Added1");
    });
  });
await fetch.getcvAcademicProjects(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-academic-projects`", element);
      print("Added1*");
    });
  });
await fetch.getcvAchievement(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-achievements`", element);
      print("Added1*");
    });
  });
await fetch.getcvAssociation(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-association`", element);
      print("Added1*");
    });
  });
  await fetch.getcvAwards(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-awards`", element);
      print("Added1*");
    });
  });
  await fetch.getcvBasic(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-basic-info`", element);
      print("Added1*");
    });
  });
  await fetch.getcvCertificate(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-certification`", element);
      print("Added1*");
    });
  });
  await fetch.getcvCoCurricular(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-co-curricular-activities`", element);
      print("Added1*");
    });
  });
  await fetch.getcvContact(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-contact`", element);
      print("Added1*");
    });
  });
  await fetch.getcvEducation(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-education`", element);
      print("Added1*");
    });
  });
  await fetch.getcvImages(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-images`", element);
      print("Added1*");
    });
  });
  await fetch.getcvInterests(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-interests`", element);
      print("Added1*");
    });
  });
  await fetch.getcvInternship(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-internship`", element);
      print("Added1*");
    });
  });
  await fetch.getcvIntroduction(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-introduction`", element);
      print("Added1*");
    });
  });
  await fetch.getcvLanguage(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-languages`", element);
      print("Added1*");
    });
  });
  await fetch.getcvPatent(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-patent`", element);
      print("Added1*");
    });
  });
  await fetch.getcvPOA(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-POA`", element);
      print("Added1*");
    });
  });
  await fetch.getcvPreference(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-preference`", element);
      print("Added1*");
    });
  });
  await fetch.getcvPresentations(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-presentations`", element);
      print("Added1*");
    });
  });
  await fetch.getcvProfessional(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-professional`", element);
      print("Added1*");
    });
  });
  await fetch.getcvPublication(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-publications`", element);
      print("Added1*");
    });
  });
  await fetch.getcvSkills(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-skills`", element);
      print("Added1*");
    });
  });
  await fetch.getcvTechnical(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-technical`", element);
      print("Added1*");
    });
  });
  await fetch.getcvTraining(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-trainings`", element);
      print("Added1*");
    });
  });
  await fetch.getcvVolunteer(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-volunteer`", element);
      print("Added1*");
    });
  });
  await fetch.getcvWork(id, authkey).then((List data) {
    data.forEach((element) {
      db.insert("`cv-work`", element);
      print("Added1*");
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
}

display() async {
  print('This display called');
  await openDatabase('assets/sections.db', version: 3,
      onOpen: (Database db) async {
    print(await db.rawQuery("SELECT * FROM `cv-academic-projects`"));
    // print(await db
    //     .rawQuery("SELECT * FROM `create-cvsection` WHERE section=51105"));
    DataPush();
    print('execute');
  });
}

class DatabaseFetch {
 Future <void> get() async {
     fetch.getbasicInfo(id, authkey).then((List basicData) async {
            sfetch.writename(basicData[0]['fullName']).then((String x) async {
            sfetch.writemail(basicData[0]['emailAddress']).then((String y)async{
                print("basicData retrieved ");
            });
            });
          });
    sfetch.readalltablescreated().then((bool status) {
      if (status == true) {
        display();
      // add();
      } else {
       initialize().then((void onValue){
         add();
       });
      }
    });
  }

}
