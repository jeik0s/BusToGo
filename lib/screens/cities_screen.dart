import 'package:bustogo/screens/city_stops_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  MainScreen({@required this.citiesNames});
   final citiesNames;

   @override
  _MainScreenState createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>{

  void showCityBusStops(String cityName) {
//    DataParser().parseBusStops(praseCityName(cityName));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityStopsScreen(cityName: cityName);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BusToGo"),
      ),
      body: ListView.builder(
        itemCount: (widget.citiesNames).length,
        itemBuilder: (context, i) {
          return ListTile(
            title: GestureDetector(
              onTap: (){
                print((widget.citiesNames)[i]);
                showCityBusStops((widget.citiesNames)[i]);
              },
              child: Text((widget.citiesNames)[i]),
            ),
          );
        },
      )
    );
  }
}