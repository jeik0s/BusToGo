import 'stand_point.dart';

class BusStop{
  BusStop({required this.name});
  String name;
  List<StandPoint> standPoints = [];

  void addStandPointToList(StandPoint newPoint){
    standPoints.add(newPoint);
  }

  String get getName{
    return name;
  }

  List<StandPoint> get getStandPoints {
    return standPoints;
  }

  void printStandPoints(){
    print(standPoints);
  }


}