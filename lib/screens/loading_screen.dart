import 'package:bustogo/screens/cities_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:bustogo/services/data_parser.dart';


class LoadingScreen extends StatefulWidget{
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>{

  @override
  void initState(){
    super.initState();
    getCitesNames();
  }

  void getCitesNames() async{
    List<String> citiesNames = await DataParser().parseCityNames();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainScreen(citiesNames: citiesNames)),
        (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context){
   return Scaffold(
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: const <Widget>[
           Text('BusToGo'),
           SizedBox(
             height: 40.0,
           ),
           SpinKitFadingCube(
             color: Colors.black,
             size: 50.0,
           ),
         ],
       )
     ),
   );
  }
}