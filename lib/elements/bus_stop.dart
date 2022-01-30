class BusStop{
  BusStop({required this.stopName});
  final stopName;
  String _stopPointName = '';
  List<String> _busNames = [];
  Map<String, List<String>> _busStopPoint = {};

  void updateStopPointName(String name){
    _stopPointName = name;
  }

  void addNewBusName(String name){
    _busNames.add(name);
  }

  void creatBusStopMap(){
    _busStopPoint[_stopPointName] = _busNames;
  }
}