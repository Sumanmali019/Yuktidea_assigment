import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yuktidea_assessment/infrastructure/dal/models/country.dart';

import '../models/terms.dart';

class ApiService {
  final String _baseUrl = 'https://studylancer.yuktidea.com/api/';

  Future<TermsAndConditions> getTermsAndConditions() async {
    var response = await http.get(Uri.parse(_baseUrl + 'terms-conditions'),
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return TermsAndConditions.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load terms and conditions');
    }
  }

  Future<List<Country>> getCountries() async {
    var response = await http.get(Uri.parse(_baseUrl + 'countries'),
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse is Map<String, dynamic> &&
          jsonResponse['data'] is List) {
        List<dynamic> body = jsonResponse['data'];
        List<Country> countries =
            body.map((dynamic item) => Country.fromJson(item)).toList();
        return countries;
      } else {
        throw Exception('Unexpected JSON format');
      }
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<void> studentLogin(String telCode, String phone) async {
    Uri uri = Uri.parse('$_baseUrl/student/login');
    var response = await http.post(
      uri,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'tel_code': telCode,
        'phone': phone,
      },
    );

    if (response.statusCode == 200) {
      // Assuming the response contains some data you might want to use
      var data = jsonDecode(response.body);
      // Handle the data or pass it along
      print(data);
    } else {
      // Handle the error
      throw Exception(
          'Failed to login student. Status code: ${response.statusCode}');
    }
  }
}
