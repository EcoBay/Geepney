import 'package:flutter/material.dart';
import 'package:geepney/components/appbar.dart';

import 'package:geepney/locations.dart' as locations;

class Disembark extends StatefulWidget {
  @override
  _DisembarkState createState() => _DisembarkState();
}

Widget EmbarkBody(){
  return Center(
    child : Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children : <Widget>[ 
        Text('Thank you!',
          style : TextStyle(
            fontSize : 30
          )
        ),
        Text('Please scan the QR code with turnstile camera when disembarking',
          style : TextStyle(
            fontSize : 8
          )
        ),
        SizedBox(height : 30),
        ClipRRect(
          child : Image(image: AssetImage('assets/b.png')),
          borderRadius : BorderRadius.circular(10.0)
        )
      ]
    )
  );
}

class _DisembarkState extends State<Disembark> {
  @override
  Widget build(BuildContext context){
    return  Scaffold( 
      appBar : GeepneyAppBar("Payment Summary"),
      body : EmbarkBody()
    );
  }
}
