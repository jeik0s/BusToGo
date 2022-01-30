import 'package:html/parser.dart';
import 'networking.dart';

import 'package:bustogo/elements/bus_stop.dart';

class DataParser{

  Future<List<String>> parseCityNames() async{

    List<String> cityNames = [];

    var pageContent = await Networking().getPageContent('https://rj.metropoliaztm.pl/przystanki/');
    var document = parse(pageContent);

    int cityNumber = document.getElementsByClassName('list-group-item').length;
    for(int i = 0;i<cityNumber;i++){
//      print((document.getElementsByClassName('list-group-item')[i].getElementsByTagName('a')[0]).text);
      cityNames.add((document.getElementsByClassName('list-group-item')[i].getElementsByTagName('a')[0]).text);
    }

    return cityNames;
  }

  Future<List<String>> parseBusStops(String cityName) async {

//    List<BusStop> busStops = [];

    List<String> busStops = [];
    int busStopNumber = 0;

    var pageContent = await Networking().getPageContent('https://rj.metropoliaztm.pl/przystanki/' + cityName);
    var documet = parse(pageContent);

    int busStopsNumber = documet.getElementsByClassName('mainsitecols')[0].getElementsByClassName('info').length;
    for(int i = 0;i<busStopsNumber;i++){
//      print((documet.getElementsByClassName('info')[i].getElementsByClassName('text-center')[0].getElementsByTagName('strong')[0]).text);
      busStops.add((documet.getElementsByClassName('info')[i].getElementsByClassName('text-center')[0].getElementsByTagName('strong')[0]).text);
    }


    int rowNumberInTimesheet = documet.getElementsByClassName('mainsitecols')[0].getElementsByTagName('tr').length;
//    print(rowNumberInTimesheet);
    for(int i = 2; i<rowNumberInTimesheet; i++){
      try{
        documet.getElementsByTagName('tr')[i].getElementsByTagName('td')[0].getElementsByTagName('small')[0];
        print(busStops[busStopNumber]);
        print(documet.getElementsByTagName('tr')[i].getElementsByTagName('td')[0].getElementsByTagName('small')[0].text);
        var numbersOfBusesInStandPoint = documet.getElementsByTagName('tr')[i].getElementsByTagName('td')[1].getElementsByTagName('div').length;
        for(int j=0;j<numbersOfBusesInStandPoint;j++){
          print((documet.getElementsByTagName('tr')[i].getElementsByTagName('td')[1].getElementsByTagName('div')[j].getElementsByTagName('a')[1].text).replaceAll(new RegExp(r"\s+\b|\b\s"),""));
        }
      } catch (e){
        busStopNumber++;
      }
    }

    return busStops;
  }

  void parseBusRoute() async{

    List<String> cityNames = [];

    var pageContent = await Networking().getPageContent('https://rj.metropoliaztm.pl/rozklady/1-157/');
    var document = parse(pageContent);

    var busDirection = document.getElementsByClassName('list-group col-xs-12 col-sm-6');
    for(int i = 0; i< busDirection.length; i++){
      var busStopsNumber = busDirection[i].getElementsByClassName('list-group-item');
      for(int j = 0; j < busStopsNumber.length; j++){
        print((busStopsNumber[j].text).trim());
      }
    }

  }


}