import 'package:flutter/material.dart';
import 'login.dart';
import 'mybutton.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomePage extends StatefulWidget {
  static const String screenRoute = 'WelcomePage';
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 300.0,
                  child: Image.asset('images/pizza.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome To",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Rhino's Pizzeria",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Mybutton(
              color: Colors.white,
              title: 'LOG IN',
              onPressed: () {
                Navigator.pushNamed(context, Login.screenRoute);
              },
            ),
            Mybutton(
              color: Colors.white,
              title: 'SIGN UP',
              onPressed: () {
                Navigator.pushNamed(context, Signup.screenRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
