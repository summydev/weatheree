import 'package:flutter/material.dart';

const kDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xffadd8e6), Color.fromARGB(255, 1, 13, 48)]),
);
const kWeatherforecastTextStyle = TextStyle(
    letterSpacing: -2,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: Colors.white);
const kDayforecastTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20.0,
    fontWeight: FontWeight.w300,
    color: Colors.yellow);
