class ForecastDTO {
  ForecastDTO({required this.sign, required this.forecast});
  final String sign;
  final String forecast;

  factory ForecastDTO.fromJson(Map<String, dynamic> json) {
    return ForecastDTO(
        sign: json["sign"] as String, forecast: json["forecast"] as String);
  }

  factory ForecastDTO.fromString(
      final String signIn, final String forecastMessage) {
    return ForecastDTO(sign: signIn, forecast: forecastMessage);
  }
}
