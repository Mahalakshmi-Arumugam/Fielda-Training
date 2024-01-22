class WeatherModel {
  final String cityName;
  final String weatherDescription;
  final double temperature;
  final double windSpeed;
  final double humidity;
  final String iconCode;

  WeatherModel({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.iconCode,
  });
}
