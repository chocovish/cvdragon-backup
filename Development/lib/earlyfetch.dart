import 'dart:async';
import 'dart:io' as io;
import 'package:cvdragonapp_v1/datapush.dart';

import './listofcreatequeries.dart';
import 'package:sqflite/sqflite.dart';
import './fetch.dart' as fetch;
import './sharedfetch.dart' as sfetch;

String id ="";
String authkey = "";
List datafrmserver;
Database database;
Future<String> initialize() async {
  print('initialized called');
   await openDatabase("assets/sections.db", version: 1,
      onOpen: (Database db) async {
    List<String> queries = createQueries;
    queries.forEach((element) async {
       db.execute(element.toString()).then((void onvalue) {
        print(queries.indexOf(element));
      });
    });
   await sfetch.writealltablescreated(true);
    return "Tables created";
  });
}

Future<void> add() async {
  id=await sfetch.readid();
  authkey=await sfetch.readauthKey();
  var db =   await openDatabase("assets/sections.db", version: 1);
  await fetch.getall(id, authkey).then((Map<String,dynamic> allthedata)
  {
    allthedata.forEach((k,v)
    {
      print(k.toString());
      v.forEach((element){
        db.insert("`"+k+"`", element);
        print(element.toString());
      });
    });
  });
//   await fetch.getcvProject(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-project`", element);
//       print("Added1");
//     });
//   });
// await fetch.getcvAcademicProjects(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-academic-projects`", element);
//       print("Added1*");
//     });
//   });
//  await fetch.getcvAchievement(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-achievements`", element);
//       print("Added1*");
//     });
//   });
//  await fetch.getcvAssociation(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-association`", element);
//       print("Added1*");
//     });
//   });
//  await  fetch.getcvAwards(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-awards`", element);
//       print("Added1*");
//     });
//   });
//   await fetch.getcvBasic(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-basic-info`", element);
//       print("Added1*");
//     });
//   });
//  await  fetch.getcvCertificate(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-certification`", element);
//       print("Added1*");
//     });
//   });
// await   fetch.getcvCoCurricular(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-co-curricular-activities`", element);
//       print("Added1*");
//     });
//   });
//  await  fetch.getcvContact(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-contact`", element);
//       print("Added1*");
//     });
//   });
//  await  fetch.getcvEducation(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-education`", element);
//       print("Added1*");
//     });
//   });
//   await fetch.getcvImages(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-images`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvInterests(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-interests`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvInternship(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-internship`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvIntroduction(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-introduction`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvLanguage(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-languages`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvPatent(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-patent`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvPOA(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-POA`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvPreference(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-preference`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvPresentations(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-presentations`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvProfessional(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-professional`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvPublication(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-publications`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvSkills(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-skills`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvTechnical(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-technical`", element);
//       print("Added1*");
//     });
//   });
//    await fetch.getcvTraining(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-trainings`", element);
//       print("Added1*");
//     });
//   });
//   await   fetch.getcvVolunteer(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-volunteer`", element);
//       print("Added1*");
//     });
//   });
//   await  fetch.getcvWork(id, authkey).then((List data) {
//     data.forEach((element) {
//       db.insert("`cv-work`", element);
//       print("Added1*");
//     });
//   });
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
  await fetch.getcvProfiles(id, authkey).then((List cvprofiles) {
    cvprofiles.forEach((element) {
      db.insert("`create-cvprofile`", element);
      print("Added4");
    });
  });
}

display() async {
  print('This display called');
    openDatabase('assets/sections.db', version: 3,
      onOpen: (Database db) async {
    print(  db.rawQuery("SELECT * FROM `cv-academic-projects`"));
    // print(  db
    //     .rawQuery("SELECT * FROM `create-cvsection` WHERE section=51105"));
    DataPush();
    print('execute');
  });
}



 Future <int> get() async {
   id=await sfetch.readid();
   authkey=await sfetch.readauthKey();
  List basicData= await  fetch.getbasicInfo(id, authkey);
  await  sfetch.writename(basicData[0]['fullName']);
  await  sfetch.writemail(basicData[0]['emailAddress']);
    print("basicData retrieved ");
  bool status=await sfetch.readalltablescreated();
      if (status == true) {
      await display();
      } else {
       await initialize();
         await add();
      }
  return 1;
  }

