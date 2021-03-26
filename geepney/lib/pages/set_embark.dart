import 'package:flutter/material.dart';
import 'package:geepney/components/appbar.dart';

import 'package:geepney/locations.dart' as locations;

class SetEmbark extends StatefulWidget {
  @override
  _SetEmbarkState createState() => _SetEmbarkState();
}

Widget EmbarkBody(){
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: locations.list.length,
    itemBuilder: (BuildContext context, int index) {  
      return Card(
        child : InkWell(
          onTap : (){
            Navigator.pushNamed(context, '/embark', arguments : locations.list[index]);
          },
          child : ListTile(
            leading : Container(
              child: Icon(
                locations.list[index]['IsLandmark'] ? Icons.location_city : Icons.place,
                size : 40.0,
                color : Colors.green[400]
              ),
              height: 50,
            ),
            title: Text(locations.list[index]['Location']),
            subtitle: Text(locations.list[index]['Address'])
          )
        )
      );
    }
  );
}

class _SetEmbarkState extends State<SetEmbark> {
  @override
  Widget build(BuildContext context){
    return  Scaffold( 
      appBar : GeepneyAppBar("Select Destination"),
      body : EmbarkBody()
    );
  }
}
