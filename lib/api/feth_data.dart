import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pexels/constants/urls.dart';

Future<Map<String, dynamic>> fetchData(int page, int perPage) async {
  final response = await http.get(
    Uri.parse("$hoemPageUrl?page=$page&per_page=$perPage"),
    headers: {
      'Authorization': myApi,
    },
  );

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON
    final Map<String, dynamic> data = json.decode(response.body);

    return data;
  } else {
    // If the server did not return a 200 OK response, throw an exception.
    throw Exception('Failed to load data');
  }
}
