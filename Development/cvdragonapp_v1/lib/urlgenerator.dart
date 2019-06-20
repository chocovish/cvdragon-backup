import 'package:http/http.dart' as http;

 String url="https://cvdragon.com/data/appResourceAPI.php";
 String url2="https://cvdragon.com/data/appCVAPI.php";
String allSectionsBasic(String id,String authkey)
{
  return url+"?id="+id+"&authkey="+authkey+"&data=allSectionsBasic";
}
String allDesigns(String id,String authkey)
{
  return url+"?id="+id+"&authkey="+authkey+"&data=allDesign";
    
}
String basic(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=basic";
    
}
String cvAchievement(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvAchievement";
}
String cvAcademicProjects(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvAcademicProjects";
}
String cvSection(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=myALLsections";
}
String cvProfileSection(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=mySubSections&CVID=4672";
}
String cvProject(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvProject";
}
String faq(String sectionID)
{
  return url+"?id=1&authkey=1&data=FaqSection&section="+sectionID;
}
String keyPhrases(String sectionid)
{
  return url+"?id=1&authkey=1&data=keyPhrases&section="+sectionid;
}