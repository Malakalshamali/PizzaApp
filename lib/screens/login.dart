import 'package:flutter/material.dart';
import 'package:pizza_app1/screens/mybutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pizza_app1/screens/homepage.dart';

class Login extends StatefulWidget {
  static const String screenRoute = 'Login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300.0,
              child: Image.asset('images/pizza.png'),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              textAlign: TextAlign.left,
              cursorColor: Colors.white70,
              onChanged: (value) {
                email = value;
                TextStyle(color: Colors.white);
              },
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white70,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              cursorColor: Colors.white70,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white70,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.password,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Mybutton(
              color: Colors.white,
              title: 'LOG IN',
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (user != null) {
                    Navigator.pushNamed(context, HomePage.screenRoute);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
