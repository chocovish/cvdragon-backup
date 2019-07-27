import 'package:flutter/material.dart';
import './sharedfetch.dart' as sfetch;
import 'dart:io';
import 'package:http/http.dart'as http;

void syncthedata()async{
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
      print(res.body);
        if(res.body=="1")
        {
          c=0;
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
   await sfetch.writeSyncQueueList(queue);
  }
} on SocketException catch (_) {
  print('not connected');
}
}