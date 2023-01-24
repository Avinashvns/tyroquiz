import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tyroquiz/screen/fouroption_screen.dart';
import 'package:tyroquiz/widget/color.dart';
import 'package:tyroquiz/widget/mainbutton.dart';
import 'package:tyroquiz/widget/maintext.dart';

class PostHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = new PostHttpOverrides();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(),
      //'/second': (context) => SimpleScreen(),
      '/second': (context) => FourOptionScreen(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Mirror"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.deepOrange],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text("Welcome in My Quiz"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    child: Image.asset("assets/images/quizmirror.JPG"),
                    borderRadius: BorderRadius.circular(100),
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.deepOrange,
                  //   ),
                  //   child: Text("Continue"),
                  //   onPressed: (){

                  //   },
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(left: 100,right: 100),
                    child: MainButton(
                      color: mainColor,
                      size: 0,
                      text: const TextWidget(
                          text: "Continue",
                          textSize: 20,
                          fontWeight: FontWeight.bold,
                          color: whiteText,
                          maxLine: 1,
                          align: TextAlign.center),
                      onPressed: () {
                        print("next Page");
                        Navigator.pushNamed(context, '/second');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
