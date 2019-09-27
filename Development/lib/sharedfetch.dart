
import 'package:shared_preferences/shared_preferences.dart';
Future<String> readname() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('name');
      return value;
    }
Future<int> readloginstatus() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getInt('loginstatus')??0;
       return value;
      }

Future<String> readmail() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('email');
      return value;
    }
Future<bool> readalltablescreated() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getBool('alltablescreated') ?? false;
      return value;
    }
Future<String> readid() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('id');
      return value;
    }
Future<String> readprofiles() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvid')??" ";
      return value;
    }
Future<String> writeprofile(String cvid) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvid', cvid);
      return "Success";
    }

Future<String> writeid(String id) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('id', id);
      return "Success";
    }
    Future<String> readauthKey() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('authKey');
      return value;
    }
   Future<String> readcolor() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvcolor')??"1";
      return value;
    }
   Future<String> readfont() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvfont')??"0";
      return value;
    }
Future<String> readdesign() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvdesign')??"0";
      return value;
    }
Future<String> readfontsize() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvfontsize')??"0";
      return value;
    }
Future<String> readdatetimeformat() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('cvdatetimeformat')??"0";
      return value;
    }

Future<String> writefontsize(String fontsize) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvfontsize',fontsize);
      return "Success";
}
Future<String> writedatetimeformat(String datetimeformat) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvdatetimeformat',datetimeformat);
      return "Success";
}
Future<String> writedesign(String design) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvdesign',design);
      return "Success";
}
Future<String> writefont(String font) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvfont',font);
      return "Success";
    }


Future<String> writecolor(String color) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('cvcolor', color);
      return "Success";
    }
Future<String> writeauthKey(String id) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('authKey', id);
      return "Success";
    }
Future<String> writename(String name) async {
      final prefs = await SharedPreferences.getInstance();
       prefs.setString('name',name);
       return "Success";
      }

Future<String> writeloginstatus(int status) async {
      final prefs = await SharedPreferences.getInstance();
       prefs.setInt('loginstatus',1);
       return "Success";
      }

Future<String> writemail(String email) async {
      final prefs = await SharedPreferences.getInstance();
       prefs.setString('email',email);
       return "Success";
      }
Future<String> writealltablescreated(bool val) async {
      final prefs = await SharedPreferences.getInstance();
       prefs.setBool('alltablescreated',val);
       return "Success";
      }
Future<String> writeSyncQueue(String query) async {
      List<String> old=await readSyncQueue();
      old.add(query);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('syncQuery',old);
      }
      Future<String> writeSyncQueueList(List query) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('syncQuery',query);
      }
  Future<List<String>> readSyncQueue() async {
      final prefs = await SharedPreferences.getInstance();
      List<String> queuelist = prefs.getStringList('syncQuery')??[];
      return queuelist;
      }


// Vishal..

Future<bool> readFirstTime() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getBool('firstTime')??true;
      return value;
    }
Future<void> writeFirstTime(bool v) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('firstTime',v);
      }