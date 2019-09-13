import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/vishal/sections/AchievmentsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/AssociatedMembersForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/CertificatesForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/CoCurricularActivityForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/HonorsAwardsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/InterestsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/IntroductionForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/LanguagesForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/PORForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/PatentForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/PreferencesForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/PresentationsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/ProfessionalQualificationsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/PublicationsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/SoftSkillsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/TechnicalKnowledge.dart';
import 'package:cvdragonapp_v1/vishal/sections/TrainingsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/VolunteerForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/WorkDetailsForm.dart';
import 'package:cvdragonapp_v1/vishal/sections/WorkProjectsForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


import './vishBottomBar.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';
import './maps.dart' as maps;
import './vishal/sections/AcademicProjects.dart';
import './vishal/sections/InternshipsForm.dart';

int index2;
String database;
List keyPhrases;
List fAQs;
List databb2;
List databb1;
String y;
String section;
String secName;
var data = [];
Map colors={
'51099':{'c1':0xffd1ca46,'c2':0xffecec9e},
'51100':{'c1':0xffef6c3e,'c2':0xff530d27},
'51101':{'c1':0xffe11f2a,'c2':0xffb6295e},
'51102':{'c1':0xfffcaa20,'c2':0xff583861},
'51103':{'c1':0xff32b547,'c2':0xff4b8ab5},
'51104':{'c1':0xff111d37,'c2':0xff3b86a6},
'51105':{'c1':0xffee438f,'c2':0xfffdb723},
'51106':{'c1':0xffb1d66f,'c2':0xff95d3bc},
'51107':{'c1':0xffe0365d,'c2':0xff9093b2},
'51108':{'c1':0xff51286a,'c2':0xff1c0f29},
'51109':{'c1':0xff283890,'c2':0xff7fa7da},
'51110':{'c1':0xfff8e690,'c2':0xfff36865},
'51111':{'c1':0xff47397d,'c2':0xffef4c61},
'51112':{'c1':0xff005e91,'c2':0xffebcd17},
'51113':{'c1':0xff5158a8,'c2':0xff00491e},
'51114':{'c1':0xfff05326,'c2':0xfff7ad30},
'51115':{'c1':0xffef383c,'c2':0xff14574},
'51116':{'c1':0xffd2d61f,'c2':0xff2d7f4f},
'51117':{'c1':0xfff6aa30,'c2':0xff854337},
'51118':{'c1':0xff17b7ab,'c2':0xffeb4752},
'51119':{'c1':0xff492e41,'c2':0xffc35352},
'51120':{'c1':0xffee5e82,'c2':0xff7e7ab5},
'51121':{'c1':0xffb2202d,'c2':0xfff7cfac},
'51122':{'c1':0xffbd3567,'c2':0xff3a2e6e},
'51123':{'c1':0xff1c6473,'c2':0xff569f67},
'51125':{'c1':0xffffda47,'c2':0xffe7193f},
'51126':{'c1':0xffaabade,'c2':0xff473694},
};
class CreateSection extends StatefulWidget {
  @override
  CreateSection(List d, int i, String sectionid, List k1, List db, List d3,List f) {
    data = d;
    index2 = i;
    keyPhrases = k1;
    section = sectionid;
    secName = maps.Sections[sectionid];
    databb1 = d3;
    databb2 = db;
    fAQs=f;
  }
  State<StatefulWidget> createState() {
    return _CreateSection();
  }
}

class _CreateSection extends State<CreateSection> {
  void _selectedTab(int index) {
    setState(() {
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("section="+section);
    return Scaffold(
       backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pinkAccent,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<Null>(
                builder: (BuildContext context) {
                  return CVView();
                },
              ),
            );
          },
          child: Icon(
            Icons.visibility,
            color: Colors.white,
          ),
          elevation: 0.0,
        ),
        bottomNavigationBar: MybottomNav(-1) ,
        body: Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                        
                        // automaticallyImplyLeading: false,
                        //backgroundColor: ,
                        expandedHeight: 160.0,
                        floating: false,
                        pinned: true,
                        flexibleSpace: 
                        Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(colors[section]["c1"]),
                      Color(colors[section]["c2"]),
                    ],
                  ),
                ),child: FlexibleSpaceBar(
              
                          centerTitle: true,
                          title: Text(secName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              )),
                        ),
                        ),),
                  ];
                },
                body: Card(
                    elevation: 5.0,
                    child: Container(
                        child: ListView(
                      padding: EdgeInsets.only(bottom: 30.0),
                      children: <Widget>[
                        Column(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    List questions=[];
                                   
                                     fAQs.forEach((e){
                                       
                                        questions.add(e['faq'].toString());
                                      });
                                      if(questions.length>0){
                                    showDialog(
                                     
                                      
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(actions: <Widget>[
                                            MaterialButton(child: Text("Close"),onPressed: (){Navigator.pop(context);},)
                                          ],
                                            title: 
                                          Text("FAQs",textAlign: TextAlign.center,),
                                        content: Container(
                                          
                                          width: MediaQuery.of(context).size.height,
                                          height: MediaQuery.of(context).size.width,                                          child: ListView(
                                          children: questions.map((q) => Html(data: q,)).toList() 
                                              ,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  
                                  else{
                                    showDialog(
                                     
                                      
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(actions:[MaterialButton(child: Text("Close"),onPressed: (){Navigator.pop(context);},)
                                          ],
                                            title: 
                                          Text("FAQs",textAlign: TextAlign.center,),
                                        content: Container(
                                          
                                          width: MediaQuery.of(context).size.height/2,
                                          height: MediaQuery.of(context).size.width/2,                                          child: ListView(
                                          children: [
                                            Text("No FAQs for this section",textAlign: TextAlign.center,),
                                          ] 
                                              ,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
                                    child: Text(
                                      "FAQs",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialogKeyPhrases(
                                              "Key Phrases", keyPhrases),
                                    );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
                                    child: Text(
                                      "Key Phrases",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    // showDialog(
                                    //   context: context,
                                    //   builder: (BuildContext context) =>
                                    //       CustomDialogDatabase("Database", data,
                                    //           databb1, section),
                                    // );
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    alignment: FractionalOffset.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xff232882),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: new Border.all(
                                            color: Colors.white)),
                                    child: Text(
                                      "Database",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: _buildCardView(context),
                          ),
                        ])
                      ],
                    ))))));
  }
}

Widget _buildCardView(BuildContext context) {
  print("$data and $index2");
  //print(data[index2]);
  if (section == "51122") return AcademicProjectsForm(i:index2==null?null:data[index2],);
  //else if (section=="51100") return BasicInfo();

  else if (section == "51106") return InternshipsForm(i:index2==null?null:data[index2]);
    //return CreateInternships(section, secName, index2, data); //Done
  else if (section == "51103") return IntroductionForm(i:index2==null?null:data[index2]);
    //return CreateIntroduction(section, secName, index2, data);
  else if (section == "51108") return ProfessionalQualificationsForm(i:index2==null?null:data[index2]);
    //return CreateProfessionalQualifications(section, secName, index2, data);
  else if (section == "51110") return CertificatesForm(i:index2==null?null:data[index2]);
    //return CreateCertificates(section, secName, index2, data);
  else if (section == "51114") return AchievementsForm(i:index2==null?null:data[index2]);
    //return CreateAchievments(section, secName, index2, data); //Done
  else if (section == "51115") return HonorsAwardsForm(i:index2==null?null:data[index2]);
    //return CreateHonorsAwards(section, secName, index2, data);
  else if (section == "51118") return SoftSkillsForm(i:index2==null?null:data[index2]);
    //return CreateSoftSkills(section, secName, index2, data);
  else if (section == "51123") return CoCurricularActivityForm(i:index2==null?null:data[index2]);
    //return CreateCoCurricularActivity(section, secName, index2, data);
  else if (section == "51125") return PresentationsForm(i:index2==null?null:data[index2]);
    //return CreatePresentations(section, secName, index2, data); //Done
  else if (section == "51120") return LanguagesForm(i:index2==null?null:data[index2]);
    //return CreateLanguages(section, secName, index2, data);
  else if (section == "51119") return InterestsForm(i:index2==null?null:data[index2]);

  else if (section == "51121") return PreferencesForm(i:index2==null?null:data[index2]);

    //return CreateInterests(section, secName, index2, data);
  else if (section == "51117") return VolunteerForm(i:index2==null?null:data[index2]);
    //return CreateVolunteerExperience(section, secName, index2, data);
  else if (section == "51104")
    return WorkDetailsForm(i:index2==null?null:data[index2]);
    //return CreateWorkDetails(section, secName, index2, data);
  else if (section == "51105") return WorkProjectsForm(i:index2==null?null:data[index2]);
    //return CreateWorkProjects(section, secName, index2, data);
  else if (section == "51107") return TrainingsForm(i:index2==null?null:data[index2]);
    //return CreateTrainingsConducted(section, secName, index2, data);
  else if (section == "51116") return AssociatedMembersForm(i:index2==null?null:data[index2]);
    //return CreateAssociatedMembers(section, secName, index2, data);
  else if (section == "51113") return PatentForm(i:index2==null?null:data[index2]);
   // return CreatePatents(section, secName, index2, data);
  else if (section == "51111") return TechnicalKnowledgeForm(i:index2==null?null:data[index2]);
    //return CreateTechnicalKnowledge(section, secName, index2, data);
  else if (section == "51112") return PublicationForm(i:index2==null?null:data[index2]);
    //return CreatePublications(section, secName, index2, data);
  else if (section == "51099") return PORForm(i:index2==null?null:data[index2]);
  //return CreatePOR(section, secName, index2, data);
}
