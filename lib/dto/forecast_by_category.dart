class ForecastByCategoryDTO {
  ForecastByCategoryDTO(
      {required this.category, required this.forecast, required this.rating});
  final String category;
  final String forecast;
  final int rating;

  factory ForecastByCategoryDTO.fromJson(Map<String, dynamic> json) {
    return ForecastByCategoryDTO(
        category: json["category"] as String,
        forecast: json["forecast"] as String,
        rating: json["rating"] as int);
  }
}
