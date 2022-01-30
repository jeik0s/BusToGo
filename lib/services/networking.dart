import 'package:http/http.dart' as http;

class Networking{

Future<dynamic> getPageContent(url) async{
  final response = await http.Client().get(Uri.parse(url));
  if(response.statusCode == 200){
    return response.body;
  } else {
    throw Exception('Cant get data from ' + url + ' url.');
  }
}
}