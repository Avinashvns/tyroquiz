
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Downloader{
  Future getDownloadData()async{
    final url=Uri.https(
      "surevih.com",
      "//public//tyroquiz/math/percentage/level1.json",
      {}
      // "surevih.com",
      // "/api/questionprint",
      // {}
      // "gist.githubusercontent.com",
      // "/champaksworldcreate/320e5af5ea9dbd31597d220637885587/raw/83f554f2c59b470a7c1a7d3ef8be32bed8d80984/tfquestions.json",
      // {} // parameter map
      // "gist.githubusercontent.com",
      //   "/champaksworldcreate/4c86f969ab509084eba3bd2603ca5ebf/raw/5fceebc6f18f7c4dedf4c5124e94f505634f656a/mcq.json",
      //   {}
    );

    try{
      print(url);
      final response=await http.get(url);
      // print(response);
      // print(response.statusCode);
      print("hi");
      final jsonResponse=convert.jsonDecode(response.body);
      print("k");
      return jsonResponse;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}

class Utilities{
  void show(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: "close",
          onPressed: (){
            
          }
        ),
      ),
    );
  }
}