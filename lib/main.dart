import 'package:flutter/material.dart';
import 'package:covid_19/homepage.dart';



void main() {
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'BalsamiqSans',
    ),
    home: HomePage(),
  ));
}
