import 'dart:convert';

import 'package:horoscope/dto/sign_dto.dart';
import 'package:horoscope/exception/service_exception.dart';
import 'package:http/http.dart' as http;

class HoroscopeService {
  static final HoroscopeService _instance = HoroscopeService._internal();
  static const String serviceBaseUri = "http://localhost:8080/horoscope";

  HoroscopeService._internal();

  factory HoroscopeService() {
    return _instance;
  }

  Future<List<SignDTO>> retrieveAllSigns() async {
    http.Response response = await http.get(Uri.parse("$serviceBaseUri/signs"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      return decodedData.map((signMap) => SignDTO.fromJson(signMap)).toList();
    }
    throw ServiceException(
        "Invalid response status code: ${response.statusCode}");
  }
}
