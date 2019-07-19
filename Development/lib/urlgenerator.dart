import 'dart:convert';
 String url="https://cvdragon.com/data/app/appResourceAPI.php";
 String   url2="https://cvdragon.com/data/app/appCVAPI.php";
 String usercreate(String name,String email,String countryCode,String phoneNumber,String typeoflogin,String socialid, String sectionType)
 {
   url+="?id=1&authkey=cvDragonAppPublicKey12345&data=createUser&contents=";
   Map<String,dynamic> contents={
        'fullName':name,
        'emailAddress':email,
        
    };
    
    url+=json.encode(contents);
    url+="&countryCode="+countryCode+"&phoneNumber="+phoneNumber+"&socialType="+typeoflogin+"&socialid="+socialid+"&sectionType="+sectionType;
    return url;
 }
String all(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=fetchAllSections";
}
String allSectionsBasic(String id,String authkey)
{
  return url+"?id="+id+"&authkey="+authkey+"&data=allSectionsBasic";
}
String allDesigns()
{
  return url+"?id=1&authkey=1&data=allDesigns";
}
String allProfileSettings()
{
  return url+"?id=1&authkey=1&data=allProfileSettings";
}
String allProfileFonts()
{
  return url+"?id=1&authkey=1&data=allProfileFonts";
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
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvAcademicProject";
}
String cvAssociation(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvAssociation";
}
String cvAwards(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvAwards";
}
String cvBasic(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvBasic";
}
String cvCertificate(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvCertificate";
}
String cvCoCurricular(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvCoCurricular";
}
String cvContact(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvContact";
}
String cvEducation(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvEducation";
}

String cvSection(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=myALLsections";
}
String cvProfileSection(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=allSubSections";
}
String cvProject(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvProject";
}
String cvImages(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvImages";
}
String cvInterests(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvInterests";
}
String cvInternship(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvInternship";
}
String cvIntroduction(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvIntroduction";
}
String cvLanguage(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvLanguage";
}
String cvPatent(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvPatent";
}
String cvPOA(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvPOA";
}
String cvPreference(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvPreference";
}
String cvPresentations(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvPresentations";
}
String cvProfessional(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvProfessional";
}
String cvPublication(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvPublication";
}
String cvSkills(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvSkills";
}
String cvTechnical(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvTechnical";
}
String cvTraining(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvTraining";
}
String cvVolunteer(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvVolunteer";
}
String cvWork(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvWork";
}
String cvProfile(String id,String authkey)
{
  return url2+"?id="+id+"&authkey="+authkey+"&data=cvProfile";
}
String faq(String sectionID)
{
  return url+"?id=1&authkey=1&data=FaqSection&section="+sectionID;
}
String keyPhrases(String sectionid)
{
  return url+"?id=1&authkey=1&data=keyPhrases&section="+sectionid;
}
String otpgenerator(String mobileno)
{
  return url+"?id=1&authkey=cvDragonAppPublicKey12345&data=verifyMobile&mobile="+mobileno+"&countryCode=91";
}
String verifyUserMobile(String mobileno)
{
  String x=url+"?id=1&authkey=cvDragonAppPublicKey12345&data=verifyUserMobile&usermobile=91"+mobileno;
  print(x);
  return x;
}
String verifyUserSocial(String socialid)
{
  String x=url+"?id=1&authkey=cvDragonAppPublicKey12345&data=verifyUserSocial&socialID="+socialid;
  print(x);
  return x;
}
