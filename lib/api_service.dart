import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model_products.dart';

class ApiServices {

  final String products_url= 'https://api.airduka.com/ad-interview/';

  Future<List<ModelProducts>> fetch_products() async {
    final response = await http
        .get(Uri.parse(products_url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.body));
      List parsedList = data['data']['data'];
      List<ModelProducts> _model = parsedList.map((val) =>  ModelProducts.fromapi(val)).toList();
      return _model;
    } else {
      throw Exception('Failed to load list');
    }
  }
}