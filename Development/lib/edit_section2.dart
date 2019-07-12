import 'package:flutter/material.dart';
import './topmenu.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';
import './bottombar_createsection.dart';
import './Sections/Volunteer_Experience.dart';
import './Sections/Interests.dart';
import './Sections/Academic_Projects.dart';
import './Sections/Basic_Info.dart';
import './Sections/Internships.dart';
import './Sections/Introduction.dart';
import './Sections/Professional_Qualifications.dart';
import './Sections/Presentations.dart';
import './Sections/Achievments.dart';
import './Sections/Certificates.dart';
import './Sections/Honors_Awards.dart';
import './Sections/Languages.dart';
import './Sections/Co_Curricular_Activity.dart';
import './Sections/Soft_Skills.dart';
import './Sections/Work_Details.dart';
import './Sections/Work_Projects.dart';
import './Sections/Trainings_Conducted.dart';
import './Sections/Associated_Members.dart';
import './Sections/Patents.dart';

List keyP;
int index;
List databb2;
List databb1;
String database;
String y;
String section;
String secName;
var data = [];

class EditSection2 extends StatefulWidget {
  @override
  EditSection2(List d, int i, List d2, int i2, List k1, List db, List d3) {
    data = d;
    index = i;
    section = d2[i2]['section'];
    secName = d2[i2]['sectionName'];
    keyP = k1;
    databb1 = d3;
    databb2 = db;
  }

  State<StatefulWidget> createState() {

    return _EditSection2();
  }
}
class _EditSection2 extends State<EditSection2> {

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
      _buildCardView(context,),
    );
  }
}

Widget _buildCardView(BuildContext context) {
  if (section == "51122")
    return AcademicProjects(section, secName, index, data, keyP, databb2, databb1); //Done
//  else if (section == "51100")
//    return BasicInfo(section, secName, index, data,keyP);
  else if (section == "51106")
    return Internships(section, secName, index, data,keyP); //Done
  else if (section == "51103")
    return Introduction(section, secName, index, data,keyP);
  else if (section == "51108")
    return ProfessionalQualifications(section, secName, index, data,keyP); //Done
  else if (section == "51110")
    return Certificates(section, secName, index, data,keyP);
  else if (section == "51114")
    return Achievments(section, secName, index, data, keyP, databb2, databb1); //Done
  else if (section == "51115")
    return HonorsAwards(section, secName, index, data,keyP); //Done
  else if (section == "51118")
    return SoftSkills(section, secName, index, data,keyP); //Done
  else if (section == "51123")
    return CoCurricularActivity(section, secName, index, data,keyP);
  else if (section == "51125")
    return Presentations(section, secName, index, data,keyP);
  else if (section == "51120")
    return Languages(section, secName, index, data,keyP);
  else if (section == "51119")
    return Interests(section,  secName, index, data,keyP);
  else if(section=="51117")
    return VolunteerExperience(section, secName, index, data,keyP);
  else if(section == "51104")
    return WorkDetails(section, secName, index, data,keyP);
  else if(section == "51105")
    return WorkProjects(section, secName, index, data,keyP);
  else if(section == "51107")
    return TrainingsConducted(section, secName, index, data,keyP);
  else if(section == "51116")
    return AssociatedMembers(section, secName, index, data, keyP, databb2, databb1);
  else if(section=="51113")
    return Patents(section, secName, index, data,keyP);
}

