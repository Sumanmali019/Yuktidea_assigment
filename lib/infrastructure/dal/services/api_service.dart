import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yuktidea_assessment/infrastructure/dal/models/country.dart';

import '../models/terms.dart';

class ApiService {
  final String _baseUrl = 'https://studylancer.yuktidea.com/api';

  Future<TermsAndConditions> getTermsAndConditions() async {
    var response = await http.get(Uri.parse('${_baseUrl}/terms-conditions'),
        headers: {'Accept': 'application/json'});
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return TermsAndConditions.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load terms and conditions');
    }
  }

  Future<List<Country>> getCountries() async {
    var response = await http.get(Uri.parse(_baseUrl + '/countries'),
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

  Future<bool> requestOtp(String telCode, String phone) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/student/login'),
      headers: {'Accept': 'application/json'},
      body: {'tel_code': telCode, 'phone': phone},
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);
      return responseJson['status'] == true;
    } else {
      return false;
    }
  }

  Future<bool> verifyOtp(String code, String phone) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/verify-otp'),
      headers: {'Accept': 'application/json'},
      body: {'code': code, 'phone': phone},
    );

    // Log the response for debugging
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      // Assuming the API returns a JSON object with a 'status' field indicating success
      final responseJson = json.decode(response.body);
      return responseJson['status'] ==
          true; // Or however the API indicates success
    } else {
      return false;
    }
  }

  Future<bool> resendOtp(String phone) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/resend-otp'),
      headers: {'Accept': 'application/json'},
      body: {'phone': phone},
    );

    if (response.statusCode == 200) {
      // Check the response body to determine if the OTP was successfully resent
      final responseJson = json.decode(response.body);
      return responseJson['status'] == true;
    } else {
      return false;
    }
  }
}
