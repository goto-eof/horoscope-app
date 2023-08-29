import 'package:horoscope/dto/forecast_by_category.dart';

class ForecastDTO {
  ForecastDTO({required this.sign, required this.forecasts});
  final String sign;
  final List<ForecastByCategoryDTO> forecasts;

  factory ForecastDTO.fromJson(Map<String, dynamic> json) {
    List forecastsJson = json["forecasts"] as List;
    List<ForecastByCategoryDTO> forecastsConverted = forecastsJson
        .map((json) => ForecastByCategoryDTO.fromJson(json))
        .toList();
    return ForecastDTO(
        sign: json["sign"] as String, forecasts: forecastsConverted);
  }
}
