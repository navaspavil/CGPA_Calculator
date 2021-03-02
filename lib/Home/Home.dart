import 'package:cgpa_app/GPA/CGPA.dart';
import 'package:cgpa_app/GPA/SGPA.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class MyCustomClipper extends CustomClipper<Path> {

  double radius = 50;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(
              Offset(size.width - radius, 0), Offset(size.width, radius)), // Rect
          1.5 * pi,   // Start engle
          0.5 * pi,  // Sweep engle
          true)  // direction clockwise
      ..lineTo(size.width, size.height - radius)
      ..arcTo(Rect.fromCircle(center: Offset(size.width - radius, size.height - radius), radius: radius), 0, 0.5 * pi, false)
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height), 0.5 * pi, 0.5 * pi, false)
      ..lineTo(0, radius)
      ..arcTo(Rect.fromLTWH(0, 0, 70, 100), 1 * pi, 0.5 * pi, false)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GPA Calculator for KTU"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Cgpa(),
                  ));
                },
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.pink[600], Colors.pink[400]])
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                      child: Text("CGPA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Sgpa(),
                  ));
                },
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.25,
                    width: MediaQuery.of(context).size.width*0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.green[700], Colors.green[400]])
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                      child: Text("SGPA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
