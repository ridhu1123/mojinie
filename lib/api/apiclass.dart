import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mojiniedemo1/models/details_responce.dart';
import 'package:mojiniedemo1/api/url.dart';
import 'package:mojiniedemo1/models/register_responce.dart';

class Api {
  final urls = UrlClass();
  Future getData() async {
    try {
      final url = urls.detailsUrl;
      final uri = Uri.parse(url);
      final responce = await http.get(uri);
      final json = jsonDecode(responce.body);
      // print("fffffffff $json");
      final data = json["products"] as List<dynamic>;
      // print("dddddddddd $data");
      final result = data.map((e) {
        return Products.fromJson(e);
      }).toList();
      // print("dddddddd $result");
      return result;
    } catch (e) {
      print("Error is :$e");
    }
  }

  Future registerData(String fname,String lname) async {
    final responce = await http.post(
        Uri.parse("http://iroidtechnologies.in/Shopnow/Shopnow_api/signup"),
        body: {
          "fname": fname,
          "lname": lname,
          "email": "hloemail",
          "mobile": "1234567890",
          "gender": "male",
          "password": "1234"
        }
        // RegisterResponce.fromJson()
        );
    print(responce.body);
  }
}
