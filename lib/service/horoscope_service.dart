import 'dart:convert';
import 'dart:io';

import 'package:horoscope/dto/sign_dto.dart';
import 'package:horoscope/exception/service_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

class HoroscopeService {
  static final HoroscopeService _instance = HoroscopeService._internal();
  final String serviceBaseUri =
      "${kIsWeb || Platform.isLinux || Platform.isFuchsia || Platform.isMacOS || Platform.isWindows ? "http://127.0.0.1" : "http://10.0.2.2"}:8080/horoscope";

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
