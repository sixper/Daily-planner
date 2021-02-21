import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/calculator");
              },
              child: Image.asset(
                "assets/images/calculator.png",
                width: 125,
                height: 125,
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/notes");
              },
              child: Image.asset(
                "assets/images/noteIcon.png",
                width: 125,
                height: 125,
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 350.0,
                height: 100.0,
                child: Container(
                  child: TypewriterAnimatedTextKit(
                    repeatForever: true,
                    text: [
                      "alzheimer revamped".toUpperCase(),
                    ],
                    textStyle: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Agne",
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/contacts");
              },
              child: Image.asset(
                "assets/images/contact.png",
                width: 125,
                height: 125,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
