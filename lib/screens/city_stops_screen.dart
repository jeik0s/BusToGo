import 'package:flutter/material.dart';
import 'package:bustogo/services/data_parser.dart';



class CityStopsScreen extends StatefulWidget{
  CityStopsScreen({required this.cityName});
  final cityName;

  @override
  _CityStopsScreenState createState() => _CityStopsScreenState();

}

class _CityStopsScreenState extends State<CityStopsScreen>{

  List<String> busStopNames = [];
  int numberOfStops = 0;

  String praseCityName(String cityName){
    String parsedCityName = cityName.toLowerCase();
    var cityNameArray = parsedCityName.split('');
    for(int i = 0; i< cityNameArray.length ; i++){
      switch(cityNameArray[i]) {
        case "ą": {  cityNameArray[i] = 'a'; } break;
        case "ć": {  cityNameArray[i] = 'c'; } break;
        case "ę": {  cityNameArray[i] = 'e'; } break;
        case "ł": {  cityNameArray[i] = 'l'; } break;
        case "ń": {  cityNameArray[i] = 'n'; } break;
        case "ó": {  cityNameArray[i] = 'o'; } break;
        case "ś": {  cityNameArray[i] = 's'; } break;
        case "ź": {  cityNameArray[i] = 'z'; } break;
        case "ż": {  cityNameArray[i] = 'z'; } break;
      }
    }
    return cityNameArray.join();
  }

  void getBusStopNames(String cityName) async {
     busStopNames = await DataParser().parseBusStops(praseCityName(cityName));
     setState(() {
       busStopNames;
     });
  }

  Widget loader(){
    if(busStopNames.isEmpty){
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        itemCount: busStopNames.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: GestureDetector(
              onTap: (){
                print(busStopNames[i]);
              },
              child: Text(busStopNames[i]),
            ),
          );
        },
      );
    }
  }

  @override
  void initState() {
    getBusStopNames(widget.cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: loader(),
    );
  }
}