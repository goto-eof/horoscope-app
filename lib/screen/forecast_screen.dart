import 'package:flutter/material.dart';
import 'package:horoscope/dto/forecast_by_category.dart';
import 'package:horoscope/dto/forecast_dto.dart';
import 'package:horoscope/dto/sign_dto.dart';
import 'package:horoscope/extension/string_extension.dart';
import 'package:horoscope/service/horoscope_service.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key, required this.signDTO});
  final SignDTO signDTO;

  @override
  State<StatefulWidget> createState() {
    return _ForecastScreenState();
  }
}

class _ForecastScreenState extends State<ForecastScreen> {
  HoroscopeService horoscopeService = HoroscopeService();
  ForecastDTO? forecast;

  @override
  void initState() {
    super.initState();
    _loadForecast();
  }

  Future<void> _loadForecast() async {
    ForecastDTO forecastResponse =
        await horoscopeService.retrieveForecast(widget.signDTO.signName);
    setState(() {
      forecast = forecastResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [], title: Text(widget.signDTO.signName.capitalize())),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.signDTO.signName.capitalize(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
            forecast != null
                ? Column(
                    children: [
                      ...forecast!.forecasts
                          .map((forecastByCategoryDTO) => ForecastByCategory(
                              forecastByCategoryDTO: forecastByCategoryDTO))
                          .toList()
                    ],
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class ForecastByCategory extends StatelessWidget {
  const ForecastByCategory({super.key, required this.forecastByCategoryDTO});
  final ForecastByCategoryDTO forecastByCategoryDTO;
  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white);
    return Text(
      "${forecastByCategoryDTO.category}: ${forecastByCategoryDTO.forecast}(${forecastByCategoryDTO.rating})",
      style: textStyle,
    );
  }
}
