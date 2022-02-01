class StandPoint{
  StandPoint({required this.name});
  String name;
  List<String> busNumbers = [];

  void addNewBusToList(String busNumber){
    busNumbers.add(busNumber);
  }

   String get getName{
    return name;
  }

  List<String> get getBusNumbers{
    return busNumbers;
  }

}