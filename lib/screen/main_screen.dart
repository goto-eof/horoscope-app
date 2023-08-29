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
    final width = MediaQuery.of(context).size.width;
    EdgeInsets edgeInsets =
        const EdgeInsets.only(left: 50, right: 50, bottom: 50, top: 20);

    SliverGridDelegateWithFixedCrossAxisCount gridDelegate =
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20);

    if (width <= 600) {
      edgeInsets =
          const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10);
      gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10);
    }
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: const Text("Oroscopo"),
      ),
      body: GridView(
        padding: edgeInsets,
        gridDelegate: gridDelegate,
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
