import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Custom_dialog.dart';
import './Custom_dialog_KeyPhrases.dart';
import './Create_New_Section/Create_Academic_Projects.dart';
import './Create_New_Section/Create_Achievments.dart';
import './Create_New_Section/Create_Associated_Members.dart';
import './Create_New_Section/Create_Basic_Info.dart';
import './Create_New_Section/Create_Certificates.dart';
import './Create_New_Section/Create_Co_Curricular_Activity.dart';
import './Create_New_Section/Create_Honors_Awards.dart';
import './Create_New_Section/Create_Interests.dart';
import './Create_New_Section/Create_Internships.dart';
import './Create_New_Section/Create_Introduction.dart';
import './Create_New_Section/Create_Languages.dart';
import './Create_New_Section/Create_Patents.dart';
import './Create_New_Section/Create_Presentations.dart';
import './Create_New_Section/Create_Professional_Qualifications.dart';
import './Create_New_Section/Create_Soft_Skills.dart';
import './Create_New_Section/Create_Trainings_Conducted.dart';
import './Create_New_Section/Create_Volunteer_Experience.dart';
import './Custom dialog database.dart';
import './Create_New_Section/Create_Work_Details.dart';
import './Create_New_Section/Create_Work_Projects.dart';
import './maps.dart'as maps;



import './fetch.dart';
int index2;
String database;
List keyPhrases;
List databb2;
List databb1;
String y;
String section;
String secName;
var data = [];
class CreateSection extends StatefulWidget {
 @override
 CreateSection(List d, int i, String sectionid, List k1, List db, List d3)
 {
data=d;
index2=i;
keyPhrases=k1;
section =sectionid;
secName = maps.Sections[sectionid];
databb1 = d3;
databb2 = db;
 }
 State<StatefulWidget> createState() {
  return _CreateSection();
 }
}
class _CreateSection extends State<CreateSection> {

 @override
 void _selectedTab(int index) {
  setState(() {
   print(index);
  });
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   backgroundColor: Colors.transparent,
   floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.pinkAccent,
    onPressed: () {
     Navigator.of(context).push(
      MaterialPageRoute<Null>(
       builder: (BuildContext context) {
        return PreviewPane();
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
   // bottomNavigationBar: BottomBar(),
   appBar: TopMenuBar(),
   drawer: SideMenu(),
   // endDrawer: PreviewPane(),
   bottomNavigationBar: FABBottomAppBar(
    onTabSelected: _selectedTab,
    notchedShape: CircularNotchedRectangle(),
    color: Colors.white30,
    centerItemText: "Preview",
    backgroundColor: Color(0xff232882),
    selectedColor: Colors.white,
    items: [
     FABBottomAppBarItem(
         iconData: Icons.import_contacts, text: 'Knowledge'),
     FABBottomAppBarItem(iconData: Icons.edit, text: 'Sections'),
     FABBottomAppBarItem(iconData: Icons.swap_vert, text: 'Profiles'),
     FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
    ],
   ),

   body:
               Container(
               decoration: BoxDecoration(
               image: DecorationImage(
               image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
               child: NestedScrollView(
               headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
               return <Widget>[
               SliverAppBar(
               automaticallyImplyLeading: false,
               backgroundColor: Colors.transparent,
               expandedHeight: 140.0,
               floating: false,
               pinned: true,
               flexibleSpace: FlexibleSpaceBar(
               centerTitle: true,
               title: Text(secName,
               style: TextStyle(
               color: Colors.white,
               fontSize: 16.0,
               )),
               )),
               ];
               },
               body: Card(
               elevation: 5.0,
               child: Container(
               child:
               ListView(padding: EdgeInsets.only(bottom: 30.0), children: <
               Widget>[
               Column(
               children: <Widget>[
               Container(
               padding: EdgeInsets.only(top: 5.0, bottom: 20.0),
               child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
               InkWell(
               onTap: () {
               showDialog(
               context: context,
               builder: (BuildContext context) => CustomDialog(
               title: "FAQs",
               description: "You ask, we answer !",
               buttonText: "Okay",
               ),
               );
               },
               child: Container(
               height: MediaQuery.of(context).size.height / 18,
               width: MediaQuery.of(context).size.width / 4,
               alignment: FractionalOffset.center,
               decoration: BoxDecoration(
               color: Color(0xff232882),
               borderRadius: BorderRadius.circular(30.0),
               border: new Border.all(color: Colors.white)),
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
               height: MediaQuery.of(context).size.height / 18,
               width: MediaQuery.of(context).size.width / 4,
               alignment: FractionalOffset.center,
               decoration: BoxDecoration(
               color: Color(0xff232882),
               borderRadius: BorderRadius.circular(30.0),
               border: new Border.all(color: Colors.white)),
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
               showDialog(
               context: context,
               builder: (BuildContext context) => CustomDialogDatabase("Database",data, databb1,section
               ),

               );
               },
               child: Container(
               height: MediaQuery.of(context).size.height / 18,
               width: MediaQuery.of(context).size.width / 4,
               alignment: FractionalOffset.center,
               decoration: BoxDecoration(
               color: Color(0xff232882),
               borderRadius: BorderRadius.circular(30.0),
               border: new Border.all(color: Colors.white)),
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
                     padding: EdgeInsets.only(left: 25,right: 25),
                     child:
               _buildCardView(context),),
   ] )],
   ))))));
 }
}

Widget _buildCardView(BuildContext context) {

 if (section == "51122")
  return CreateAcademicProjects(section, secName, index2, data);
 else if (section == "51100")
   return CreateBasicInfo(section, secName);
 else if (section == "51106")
   return CreateInternships(section, secName); //Done
 else if (section == "51103")
   return CreateIntroduction(section, secName);
 else if (section == "51108")
   return CreateProfessionalQualifications(section, secName); //Done
 else if (section == "51110")
   return CreateCertificates(section, secName);
 else if (section == "51114")
   return CreateAchievments(section, secName); //Done
 else if (section == "51115")
   return CreateHonorsAwards(section, secName); //Done
 else if (section == "51118")
   return CreateSoftSkills(section, secName); //Done
 else if (section == "51123")
   return CreateCoCurricularActivity(section, secName);
 else if (section == "51125")
   return CreatePresentations(section, secName, index, data);
 else if (section == "51120")
   return CreateLanguages(section, secName);
 else if (section == "51119")
   return CreateInterests(section,  secName);
 else if(section=="51117")
   return CreateVolunteerExperience(section, secName);
 else if(section == "51104")
   return CreateWorkDetails(section, secName);
 else if(section == "51105")
   return CreateWorkProjects(section, secName);
 else if(section == "51107")
   return CreateTrainingsConducted(section, secName);
 else if(section == "51116")
   return CreateAssociatedMembers(section, secName);
 else if(section=="51113")
   return CreatePatents(section, secName);

}

