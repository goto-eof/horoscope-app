import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:horoscope/dto/sign_dto.dart';
import 'package:horoscope/service/horoscope_service.dart';
import 'package:horoscope/widget/sign.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late List<SignDTO> signs = [];
  HoroscopeService horoscopeService = HoroscopeService();

  @override
  void initState() {
    super.initState();
    _populateSigns();
  }

  Future<void> _populateSigns() async {
    List<SignDTO> signsFromService = await horoscopeService.retrieveAllSigns();
    setState(() {
      signs = signsFromService;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Oroscopo"),
      ),
      body: GridView(
        padding:
            const EdgeInsets.only(left: 100, right: 100, bottom: 100, top: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...signs.map(
            (signDTO) => Sign(
              signDTO: signDTO,
            ),
          ),
        ],
      ),
    );
  }
}
