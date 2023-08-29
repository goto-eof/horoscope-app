import 'package:flutter/material.dart';
import 'package:horoscope/dto/sign_dto.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key, required this.signDTO});
  final SignDTO signDTO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [], title: Text(signDTO.signName)),
        body: Text(signDTO.signName));
  }
}
