import 'package:flutter/material.dart';
import 'package:geepney/locations.dart' as locations;

//Pages
import 'package:geepney/pages/set_embark.dart';

void main() => runApp(MaterialApp(
  theme : ThemeData(
    primaryColor : Colors.red[900],
  ),
  initialRoute : '/home',
  routes: {
    '/' : (context) => SetEmbark(),
    '/home' : (context) => SetEmbark(),
  }
));
