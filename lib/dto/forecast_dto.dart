class ForecastDTO {
  ForecastDTO({required this.sign, required this.forecast});
  final String sign;
  final String forecast;

  factory ForecastDTO.fromJson(Map<String, String> json) {
    return ForecastDTO(
        sign: json["sign"] as String, forecast: json["forecast"] as String);
  }
}
