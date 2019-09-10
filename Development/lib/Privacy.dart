import 'package:cvdragonapp_v1/vishBottomBar.dart';
import 'package:flutter/material.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/painting.dart';
import './sidemenu.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import './rightpreviewpane.dart';



String abtext = """

This Privacy Policy governs the manner in which cvDragon collects, uses, maintains and discloses information collected from users (each, a "User") of the https://cvdragon.com/ website ("Site").

### **Personal identification information**

We may collect personal identification information from Users in a variety of ways, including, but not limited to, when Users visit our site, register on the site, and in connection with other activities, services, features or resources we make available on our Site. Users may be asked for, as appropriate, name, email address, mailing address, phone number. Users may, however, visit our Site anonymously. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personally identification information, except that it may prevent them from engaging in certain Site related activities.

### Non-personal identification information

We may collect non-personal identification information about Users whenever they interact with our Site. Non-personal identification information may include the browser name, the type of computer and technical information about Users means of connection to our Site, such as the operating system and the Internet service providers utilized and other similar information.

### Web browser cookies

Our Site may use "cookies" to enhance User experience. User's web browser places cookies on their hard drive for record-keeping purposes and sometimes to track information about them. User may choose to set their web browser to refuse cookies, or to alert you when cookies are being sent. If they do so, note that some parts of the Site may not function properly.

### How we use collected information

cvDragon may collect and use Users personal information for the following purposes:

-   _To run and operate our Site_  
    We may need your information display content on the Site correctly.
-   _To improve customer service_  
    Information you provide helps us respond to your customer service requests and support needs more efficiently.
-   _To personalize user experience_  
    We may use information in the aggregate to understand how our Users as a group use the services and resources provided on our Site.
-   _To improve our Site_  
    We may use feedback you provide to improve our products and services.
-   _To send periodic emails_  
    We may use the email address to send them information and updates pertaining to their order.

### How we protect your information

We adopt appropriate data collection, storage and processing practices and security measures to protect against unauthorized access, alteration, disclosure or destruction of your personal information, username, password, transaction information and data stored on our Site.

### Sharing your personal information

We do not sell, trade, or rent Users personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.

### Changes to this privacy policy

cvDragon has the discretion to update this privacy policy at any time. When we do, we will post a notification on the main page of our Site, revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.

### Your acceptance of these terms

By using this Site, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our Site. Your continued use of the Site following the posting of changes to this policy will be deemed your acceptance of those changes

### Contacting us

If you have any questions about this Privacy Policy, the practices of this site, or your dealings with this site, please contact us.

This document was last updated on January 05, 2018""";

class Privacy extends StatelessWidget{
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
                      Center(child: Text("Privacy",style: TextStyle(fontSize: 30,color: Colors.white,),),),
                      Text(abtext,style: TextStyle(color: Colors.white,fontSize: 16),),
                    ],
                  ) ,
                ) 
                

              ),
      ),
    );
  }
}
