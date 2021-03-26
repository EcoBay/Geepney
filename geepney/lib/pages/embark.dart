import 'package:flutter/material.dart';
import 'package:geepney/components/appbar.dart';

import 'package:geepney/locations.dart' as locations;

class Embark extends StatefulWidget {
  @override
  _EmbarkState createState() => _EmbarkState();
}

Widget EmbarkBody(){
  return Center(
    child : Column(
      mainAxisAlignment : MainAxisAlignment.center,
      children : <Widget>[ 
        ClipRRect(
          child : Image(image: AssetImage('assets/a.png')),
          borderRadius : BorderRadius.circular(40.0)
        ),
        SizedBox(height : 10),
        Text('scanning will start automatically',
          style : TextStyle(
            fontSize : 10
          )
        )
      ]
    )
  );
}

class _EmbarkState extends State<Embark> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds : 5)).then( (__) {
      Navigator.pushNamed(context, "/payment", arguments : ModalRoute.of(context).settings.arguments);
    });
  }

  @override
  Widget build(BuildContext context){
    return  Scaffold( 
      appBar : GeepneyAppBar("Place QR code inside scanning area"),
      body : EmbarkBody()
    );
  }
}
