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