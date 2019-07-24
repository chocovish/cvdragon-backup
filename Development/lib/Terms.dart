import 'package:flutter/material.dart';
import './bottombar_home.dart';
import './topmenu.dart';
import 'package:cvdragonapp_v1/cvwebview.dart';
import 'package:cvdragonapp_v1/rightpreviewpane.dart';
import 'package:flutter/painting.dart';
import './sidemenu.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import './rightpreviewpane.dart';



String abtext = """These terms and conditions govern your use of this website; by using this website, you accept these terms and conditions in full.   If you disagree with these terms and conditions or any part of these terms and conditions, you must not use this website.

[You must be at least [18] years of age to use this website.  By using this website [and by agreeing to these terms and conditions] you warrant and represent that you are at least [18] years of age.]

### **License to use website**

Unless otherwise stated, cvDragon and/or its licensors own the intellectual property rights in the website and material on the website.  Subject to the license below, all these intellectual property rights are reserved.

You may view, download for caching purposes only, and print pages [or [OTHER CONTENT]] from the website for your own personal use, subject to the restrictions set out below and elsewhere in these terms and conditions. 

**You must not:**

- republish material from this website (including republication on another website);
- sell, rent or sub-license material from the website;
- show any material from the website in public;
- reproduce, duplicate, copy or otherwise exploit material on this website for a commercial purpose;]
- [edit or otherwise modify any material on the website; or]
- [redistribute material from this website [except for content specifically and expressly made available for redistribution].]
 

[Where content is specifically made available for redistribution, it may only be redistributed [within your organisation].]

### **Acceptable use**

You must not use this website in any way that causes, or may cause, damage to the website or impairment of the availability or accessibility of the website; or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity.

You must not use this website to copy, store, host, transmit, send, use, publish or distribute any material which consists of (or is linked to) any spyware, computer virus, Trojan horse, worm, keystroke logger, rootkit or other malicious computer software.

You must not conduct any systematic or automated data collection activities (including without limitation scraping, data mining, data extraction and data harvesting) on or in relation to this website without cvDragon’s express written consent.

[You must not use this website to transmit or send unsolicited commercial communications.]

[You must not use this website for any purposes related to marketing without cvDragon’s express written consent.] 

**Restricted access**

[Access to certain areas of this website is restricted.]  cvDragon reserves the right to restrict access to [other] areas of this website, or indeed this entire website, at cvDragon’s discretion.

If cvDragon provides you with a user ID and password to enable you to access restricted areas of this website or other content or services, you must ensure that the user ID and password are kept confidential. 

[cvDragon may disable your user ID and password in cvDragon’s sole discretion without notice or explanation.]

**User content**

In these terms and conditions, “your user content” means material (including without limitation text, images, audio material, video material and audio-visual material) that you submit to this website, for whatever purpose.

You grant to cvDragon a worldwide, irrevocable, non-exclusive, royalty-free license to use, reproduce, adapt, publish, translate and distribute your user content in any existing or future media.  You also grant to cvDragon the right to sub-license these rights, and the right to bring an action for infringement of these rights.

Your user content must not be illegal or unlawful, must not infringe any third party's legal rights, and must not be capable of giving rise to legal action whether against you or cvDragon or a third party (in each case under any applicable law). 

You must not submit any user content to the website that is or has ever been the subject of any threatened or actual legal proceedings or other similar complaint.

cvDragon reserves the right to edit or remove any material submitted to this website, or stored on cvDragon’s servers, or hosted or published upon this website.

[Notwithstanding cvDragon’s rights under these terms and conditions in relation to user content, cvDragon does not undertake to monitor the submission of such content to, or the publication of such content on, this website.]

**No warranties**

This website is provided “as is” without any representations or warranties, express or implied.  cvDragon makes no representations or warranties in relation to this website or the information and materials provided on this website. 

Without prejudice to the generality of the foregoing paragraph, cvDragon does not warrant that:

- this website will be constantly available, or available at all; or
- the information on this website is complete, true, accurate or non-misleading.
 

Nothing on this website constitutes, or is meant to constitute, advice of any kind.  [If you require advice in relation to any [legal, financial or medical] matter you should consult an appropriate professional.]

**Limitations of liability**

cvDragon will not be liable to you (whether under the law of contact, the law of torts or otherwise) in relation to the contents of, or use of, or otherwise in connection with, this website:

- [to the extent that the website is provided free-of-charge, for any direct loss;]
- for any indirect, special or consequential loss; or
- for any business losses, loss of revenue, income, profits or anticipated savings, loss of contracts or business relationships, loss of reputation or goodwill, or loss or corruption of information or data.
 

These limitations of liability apply even if cvDragon has been expressly advised of the potential loss.

**Exceptions**

Nothing in this website disclaimer will exclude or limit any warranty implied by law that it would be unlawful to exclude or limit; and nothing in this website disclaimer will exclude or limit cvDragon’s liability in respect of any:

death or personal injury caused by cvDragon’s negligence;
fraud or fraudulent misrepresentation on the part of cvDragon; or
matter which it would be illegal or unlawful for cvDragon to exclude or limit, or to attempt or purport to exclude or limit, its liability.
 

**Reasonableness**

By using this website, you agree that the exclusions and limitations of liability set out in this website disclaimer are reasonable. 

If you do not think they are reasonable, you must not use this website.

**Other parties**

[You accept that, as a limited liability entity, cvDragon has an interest in limiting the personal liability of its officers and employees.  You agree that you will not bring any claim personally against cvDragon’s officers or employees in respect of any losses you suffer in connection with the website.]

[Without prejudice to the foregoing paragraph,] you agree that the limitations of warranties and liability set out in this website disclaimer will protect cvDragon’s officers, employees, agents, subsidiaries, successors, assigns and sub-contractors as well as cvDragon.

**Unenforceable provisions**

If any provision of this website disclaimer is, or is found to be, unenforceable under applicable law, that will not affect the enforceability of the other provisions of this website disclaimer.

**Indemnity**

You hereby indemnify cvDragon and undertake to keep cvDragon indemnified against any losses, damages, costs, liabilities and expenses (including without limitation legal expenses and any amounts paid by cvDragon to a third party in settlement of a claim or dispute on the advice of cvDragon’s legal advisers) incurred or suffered by cvDragon arising out of any breach by you of any provision of these terms and conditions[, or arising out of any claim that you have breached any provision of these terms and conditions].

**Breaches of these terms and conditions**

Without prejudice to cvDragon’s other rights under these terms and conditions, if you breach these terms and conditions in any way, cvDragon may take such action as cvDragon deems appropriate to deal with the breach, including suspending your access to the website, prohibiting you from accessing the website, blocking computers using your IP address from accessing the website, contacting your internet service provider to request that they block your access to the website and/or bringing court proceedings against you.

**Variation**

cvDragon may revise these terms and conditions from time-to-time.  Revised terms and conditions will apply to the use of this website from the date of the publication of the revised terms and conditions on this website.  Please check this page regularly to ensure you are familiar with the current version.

**Assignment**

cvDragon may transfer, sub-contract or otherwise deal with cvDragon’s rights and/or obligations under these terms and conditions without notifying you or obtaining your consent.

You may not transfer, sub-contract or otherwise deal with your rights and/or obligations under these terms and conditions. 

**Severability**

If a provision of these terms and conditions is determined by any court or other competent authority to be unlawful and/or unenforceable, the other provisions will continue in effect.  If any unlawful and/or unenforceable provision would be lawful or enforceable if part of it were deleted, that part will be deemed to be deleted, and the rest of the provision will continue in effect.

**Entire agreement**

These terms and conditions [, together with [DOCUMENTS],] constitute the entire agreement between you and cvDragon in relation to your use of this website, and supersede all previous agreements in respect of your use of this website.

 

**cvDragon’s details**

cvDragon’s registered address is 7 RABINDRA SARANI,6TH FLOOR, KOLKATA - 700001 

You can contact cvDragon by email to cvdragon@lifeinmba.com """;

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopMenuBar(),
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
      drawer: SideMenu(),
      endDrawer: PreviewPane(),
      bottomNavigationBar: FABBottomAppBar(
        //onTabSelected: _selectedTab,
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
      body: Container(

        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/35,left: 10,right:5),
        child: Column(
          children: <Widget>[
            Container(margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/40),
              child: Row(
                children: <Widget>[
                  Text("Terms & Conditions",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width/10)),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 15),
              height: MediaQuery.of(context).size.height/1.5,
              child: new Markdown(data:abtext),

            )
          ],
        ),
      ),
    );
  }
}
