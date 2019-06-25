import 'package:shared_preferences/shared_preferences.dart';

Future<String> readname() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('name');
      return value;
    }

Future<String> readmail() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('email');
      return value;
    }
Future<bool> readalltablescreated() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getBool('alltablescreated') ?? null;
      return (value==null?false:value);
    }
Future<String> readid() async {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('id');
      return value;
    }


Future<String> writename(String name) async {
      final prefs = await SharedPreferences.getInstance();
       prefs.setString('name',name);
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