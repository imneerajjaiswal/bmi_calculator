// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/splash_Screen.dart';

import 'intro_page.dart';

void main(List<String> args) {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  // yeh var value get krne ke liye user se
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var incController = TextEditingController();
  
  var result = '';
  var bgColor ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Statetfull'),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                    
                      label: Text('Enter Your Weight(in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight_outlined)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: htController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter Your Hieght(in Feet)'),
                      prefixIcon: Icon(Icons.height_outlined)),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: incController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter Your Hieght(in Inch)'),
                      prefixIcon: Icon(Icons.height_sharp)),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(

                    onPressed: () {
                      //yeh user se value lene ke liye value string me ayegi diect in m nahi aa skti
                      var weight = wtController.text.toString();
                      var feet = htController.text.toString();
                      var inch = incController.text.toString();


                      if (weight != '' && feet != '' && inch != '') {

                       // value ko string se int m convert krne ke liye
                        int intweight = int.parse(weight);
                        int intfeet = int.parse(feet);
                        int intinch = int.parse(inch);

                        // yeh mathemetics calculation 
                        var totalINCH = intfeet * 12 + intinch; //feet ko inch m convert
                        var totalCM = totalINCH * 2.54; // inch ko cm me 
                        var totalM = totalCM / 100; //cm ko meter m

                        var bmi = intweight / (totalM * totalM);
                                                // toStringAsFixed ka use hum point m value jaise 14.22545 aise likh hi usko sirf 12.21 m dikhane ke liye
                        result = 'Your BMI is : ${bmi.toStringAsFixed(2)}';
                        
                        // setState func ui pe show krne ke liye
                        setState(() {});


                      } else {
                        setState(() {
                          result = 'Plese fill all required blanks!!';
                        });
                      }
                    },
                    child: Text('Calculate')),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(color: Colors.red, fontSize: 19),
                )
              ],
            ),
          ),
        ));
  }
}



