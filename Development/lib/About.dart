import 'package:cvdragonapp_v1/vishBottomBar.dart';
import 'package:flutter/material.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import './sidemenu.dart';
import './rightpreviewpane.dart';


String abtext = """

cvDragon is an online platform which will cater to the need of an organized and systematic resume. Resumes have become the first criteria for selection for every selector.

Job Seekers nowadays has to be very careful with their resumes as it will prove to be their first appearance to the selectors. To help the job seekers meet the expectation of all interviewers cvDragon will be the one stop destination.

cvDragon has been launched with a lot of interesting and helpful features which will help you create your resume quickly and professionally.

cvDragon is the brainchild of experienced corporate members who have been continuously involved with interviews and CV scanning for long. cvDragon will give the candidates the first-hand suggestions and advice to prepare their resume in a perfect and organized manner. Created by experts cvDragon will serve the needs of both Organizations and job seekers

Too Short Resume, Disorganized Resumes, Resumes with spelling and grammatical mistakes, resumes lacking formatting, etc. -  
cvDragon will provide the solution to all the above problems faced by job seekers while preparing their CV.  
It will remove the hassle and struggle of figuring out what to include and what not to include.  
With more than 50 resume formats and styles of resume templates, every job seeker will have a chance to prove themselves to be unique, standing out in the crowd of millions.""";
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/atp.png'),fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: TopMenuBar(),
        drawer: SideMenu(),
        bottomNavigationBar: MybottomNav(-1),
        floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () async{
              // await generateresumeid();
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
        endDrawer: PreviewPane(),
        body: Container(
          margin: EdgeInsets.only(top: 5,left: 10,right:5,),

                // child: new Markdown(data:abtext),
                child:SingleChildScrollView(
                  child:Column(
                    children: <Widget>[
                       Padding(padding: EdgeInsets.only(bottom: 25),),
                      Center(child: Text("About Us",style: TextStyle(fontSize: 30,color: Colors.white,),),),
                      Text(abtext,style: TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ) ,
                ) 
                

              ),
      ),
    );
  }
}
