import 'package:flutter/material.dart';

Widget GeepneyAppBar(String subtitle) {
  return AppBar(
    title : 
      Column(
        children : <Widget>[
          Text('Geepney',
              style : TextStyle(
              fontSize : 24.0, 
              fontFamily : 'Quiapo'
            )
          ),
          Text(subtitle,
            style : TextStyle(
              fontSize : 12.0
            )
          )
        ]
      ),
    centerTitle : true,
    actions : <Widget>[
      IconButton(
        icon : Icon(Icons.search,
          color : Colors.white
        ),
        tooltip : 'Search Address'
      )
    ]
  );
}
