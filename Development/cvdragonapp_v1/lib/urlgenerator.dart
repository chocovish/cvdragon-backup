import 'package:http/http.dart' as http;

 String basic="https://cvdragon.com/data/appResourceAPI.php";
String allSectionsBasic(String id,String authkey)
{
  return basic+"?id="+id+"&authkey="+authkey+"&data=allSectionsBasic";
}
String allDesigns(String id,String authkey)
{
  return basic+"?id="+id+"&authkey="+authkey+"&data=allDesign";
    
}

