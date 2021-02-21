import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int firsNumber;
  int secondNumber;

  String sum = "";
  String res;
  String operation;


  void buttonClicked(String buttonValue) {
    if (buttonValue == "C") {
      firsNumber = 0;
      secondNumber = 0;

      sum = "";
      res = "";
      operation = "";
    } else if (buttonValue == "+" ||
        buttonValue == "-" ||
        buttonValue == "x" ||
        buttonValue == "/") {
      firsNumber = int.parse(sum);
      res = "";
      operation
      = buttonValue;
    } else if (buttonValue == "=") {
      secondNumber = int.parse(sum);

      if (operation
          == "+") {
        res = (firsNumber + secondNumber).toString();
      }

      if (operation
          == "-") {
        res = (firsNumber - secondNumber).toString();
      }

      if (operation
          == "x") {
        res = (firsNumber * secondNumber).toString();
      }

      if (operation
          == "/") {
        res = (firsNumber ~/ secondNumber).toString();
      }
    } else {
      res = int.parse(sum + buttonValue).toString();
    }

    setState(() {
      sum = res;
    });
  }

  Widget createButton(String buttonValue) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => buttonClicked(buttonValue),
        child: Text(
          "$buttonValue",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("CALCULATOR"),
        ),
        body: SafeArea(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "$sum",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.w600),
                      ))),
              Row(
                children: <Widget>[
                  createButton("9"),
                  createButton("8"),
                  createButton("7"),
                  createButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  createButton("6"),
                  createButton("5"),
                  createButton("4"),
                  createButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  createButton("3"),
                  createButton("2"),
                  createButton("1"),
                  createButton("x"),
                ],
              ),
              Row(
                children: <Widget>[
                  createButton("C"),
                  createButton("0"),
                  createButton("="),
                  createButton("/"),
                ],
              ),
            ],
          )),
        ));
  }
}
