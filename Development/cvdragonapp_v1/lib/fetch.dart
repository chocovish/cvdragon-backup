import 'package:http/http.dart' as http;
import 'dart:convert';
class Fetch{
List sectionDetails()  {
     //loader(true);
     List sectionDet=[];
    http
        .get(
            'https://cvdragon.com/data/appResourceAPI.php?id=1&authkey=1&data=allSectionsBasicWS')
        .then((http.Response response) {
     sectionDet = json.decode(response.body);
     print('called2'); 
     return sectionDet;
    });
    //print(sectionDet);
    //loader(false);
  }
}