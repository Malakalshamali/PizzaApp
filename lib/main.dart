import 'package:flutter/material.dart';
import 'package:pizza_app1/screens/login.dart';
import 'package:pizza_app1/screens/signup.dart';
import 'screens/welcomePage.dart';
import 'package:pizza_app1/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rhino's Pizzeria",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: welcomePage(),
      initialRoute: WelcomePage.screenRoute,
      routes: {
        WelcomePage.screenRoute: (context) => WelcomePage(),
        Login.screenRoute: (context) => Login(),
        Signup.screenRoute: (context) => Signup(),
        HomePage.screenRoute: (context) => HomePage(),
      },
    );
  }
}
