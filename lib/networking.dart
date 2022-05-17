import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.Url);

  final String Url;

  Future getData() async {
    var uri = Uri.parse(Url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
