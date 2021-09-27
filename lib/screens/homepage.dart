//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'dart:ui';
import 'package:pizza_app1/screens/detailpage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomePage extends StatefulWidget {
  static const String screenRoute = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseStorage.instance;
  late User signupUser;

  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signupUser = user;
        print(signupUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

/*  Future<Widget> _getImage(BuildContext context, String imageName) async {
    Image image;
    await FireStorgeService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
      );
    });
    return image;
  }*/

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: ListView(
          children: [
            SizedBox(
              height: 10.0,
            ),
//making the location and the cart
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.red[900],
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        "Irbid, Jordan",
                        style:
                            TextStyle(fontSize: 18.0, color: Colors.red[900]),
                      ),
                    ],
                  ),
                  Container(
                    height: 55.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Colors.grey, width: 2.0)),
                    child: Icon(Icons.shopping_basket, color: Colors.red[900]),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
//
// Container for the info for 10 min delivery
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Container(
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.red[900],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: width / 20),
                      height: 150.0,
                      width: width / 2.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10-minute\ndelivery",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: width / 30,
                          ),
                          Text(
                            "Enjoy your food in just 10\nminutes. Free Forever",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),

                    //here comes the image
                    Container(
                      height: 150.0,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/6.png"))),
                    )
                  ],
                ),
              ),
            ),
            //container ends here
            SizedBox(
              height: 10.0,
            ),

            Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Text("Explore Favorite Pizza",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
            ),
            //we need the widget here now that is in listview
            Container(
              height: 180.0,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: pizzaTabs("Italian", "34", "images/1.png"),
                  ),
                  pizzaTabs("Mexican", "24", "images/4.png"),
                  pizzaTabs("American", "21", "images/3.png")
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            //new tab for the reataurant in cities....
            Padding(
              padding: EdgeInsets.all(
                20.0,
              ),
              child: Row(
                children: [
                  Text("Restaurants in ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text("Irbid,Jordan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red[900]))
                ],
              ),
            ),
            //its container
            Container(
              // color: Colors.red,
              height: 200.0,
              width: width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: restaurantsTabs("https://rb.gy/wqz3ug",
                          "Pizzeria Mazza", "Italian", "4.9km")),
                  restaurantsTabs("https://rb.gy/wqz3ug", "Pizzeria Land",
                      "Mexican", "3.2km"),
                  restaurantsTabs("https://rb.gy/wqz3ug", "Pizzeria Mazza",
                      "Cuisine", "4.9km")
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.red[900],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.circle,
                color: Colors.grey[400],
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.grey[400],
              ),
              label: ""),
        ],
      ),
    );
  }

  Widget restaurantsTabs(
      String address, String name, String dish, String diatance) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailPage())),
          child: Container(
            width: width / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.0,
                  width: width / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(address), fit: BoxFit.cover)),
                ),
                //name of the dish
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red[900]),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$dish - $diatance - \$-10",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget pizzaTabs(String title, String no, String assetimage) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Container(
        height: 170.0,
        width: width / 3.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red[900],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("$no restaurants", style: TextStyle(color: Colors.white)),
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: AssetImage(assetimage),
              height: 80.0,
              width: 80.0,
            )
          ],
        ),
      ),
    );
  }
}

class FireStorgeService extends ChangeNotifier {
  FireStorgeService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
