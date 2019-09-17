import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sharedfetch.dart' as sfetch;
import 'dart:io';
import 'package:http/http.dart'as http;
import './Notifiers.dart';


syncMsg(BuildContext context) {
    CupertinoAlertDialog d = CupertinoAlertDialog(
      content: Text("Some Error happened!",style: TextStyle(color: Colors.red),),
      actions: <Widget>[
        CupertinoButton(
          child: Text("OK!"),
          onPressed: Navigator.of(context).pop,
        )
      ],
    );

    showCupertinoDialog(context: context, builder: (_) => d);
  }








Future<void> syncthedata(BuildContext context) async{
  syncOnGoing.value = true;
//Scaffold.of(context).showSnackBar(SnackBar(content: Text("Started Sync"),backgroundColor: Colors.amber,));
try {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    print('connected');
    List queue=await sfetch.readSyncQueue();
   int c=0;
   for(var i=0;i<queue.length;i++)
    {
      print("c="+c.toString());
        if(c==5){
        break;}
      print(queue[i]);
      http.Response res=await http.get(queue[i]);
      print(" response is ${res.body}");
        if(res.body=="1")
        { 
           queue[i]="1";
        }
        else
        {
          i=i-1;
          c++;
          
        }

    }
    print("Before " +queue.length.toString());
   queue.removeWhere((item) => item== "1");
   print("After " +queue.length.toString());
   if(queue.length>0) syncMsg(context);   
   await sfetch.writeSyncQueueList(queue);
   syncNotifier.value = false;

  }
} on SocketException catch (_) {
  Scaffold.of(context).showSnackBar(SnackBar(content: Text("No Internet"),backgroundColor: Colors.amber,));
}
syncOnGoing.value = false;
}