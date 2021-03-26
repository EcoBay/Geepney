import 'package:flutter/material.dart';
import 'package:geepney/locations.dart' as locations;

//Pages
import 'package:geepney/pages/set_embark.dart';
import 'package:geepney/pages/embark.dart';
import 'package:geepney/pages/disembark.dart';
import 'package:geepney/pages/payment.dart';


void main() => runApp(MaterialApp(
  theme : ThemeData(
    primaryColor : Colors.green[500],
  ),
  initialRoute : '/home',
  routes: {
    '/' : (context) => SetEmbark(),
    '/home' : (context) => SetEmbark(),
    '/embark' : (context) => Embark(),
    '/payment' : (context) => Payment(),
    '/disembark' : (context) => Disembark(),
  }
));
