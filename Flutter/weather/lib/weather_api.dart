// ignore_for_file: avoid_print, use_rethrow_when_possible

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'weather_model.dart';

class WeatherApi {
  static Future<WeatherModel> fetchWeather(
      double latitude, double longitude) async {
    const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return WeatherModel(
        cityName: data['name'],
        weatherDescription: data['weather'][0]['description'],
        temperature: (data['main']['temp'] - 273.15),
        windSpeed: data['wind']['speed'],
        humidity: data['main']['humidity'].toDouble(),
        iconCode: data['weather'][0]['icon'],
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<Map<String, List<Map<String, dynamic>>>> fetchDailyWeather(
      double latitude, double longitude) async {
    const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
    final url =
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> forecastList = jsonDecode(response.body)['list'];

      Map<String, List<Map<String, dynamic>>> dailyForecastData = {};

      for (var forecast in forecastList) {
        String date = forecast['dt_txt'].toString();
        String day = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

        dailyForecastData.putIfAbsent(day, () => []);

        double temperature = forecast['main']['temp'] - 273.15;
        double humidity = forecast['main']['humidity'].toDouble();
        double windSpeed = forecast['wind']['speed'];
        String iconCode = forecast['weather'][0]['icon'];

        dailyForecastData[day]!.add({
          'date':
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(date)),
          'temperature': temperature,
          'humidity': humidity,
          'windSpeed': windSpeed,
          'iconCode': iconCode,
        });
      }

      return dailyForecastData;
    } else {
      throw Exception('Failed to load daily weather data');
    }
  }

  static Future<Map<String, dynamic>> fetchWeatherByCity(String city) async {
    const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load weather data for $city');
    }
  }

  static Future<Map<String, List<Map<String, dynamic>>>>
      fetchDailyWeatherByCity(String city) async {
    try {
      const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> forecastList = jsonDecode(response.body)['list'];

        Map<String, List<Map<String, dynamic>>> dailyForecastData = {};

        for (var forecast in forecastList) {
          String date = forecast['dt_txt'].toString();
          String day = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

          dailyForecastData.putIfAbsent(day, () => []);

          double temperature = forecast['main']['temp'] - 273.15;
          double humidity = forecast['main']['humidity'].toDouble();
          double windSpeed = forecast['wind']['speed'];
          String hourlyIconCode = forecast['weather'][0]['icon'];

          dailyForecastData[day]!.add({
            'date':
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(date)),
            'temperature': temperature,
            'humidity': humidity,
            'windSpeed': windSpeed,
            'iconCode': hourlyIconCode,
          });
        }

        return dailyForecastData;
      } else {
        throw Exception('Failed to load daily weather data for $city');
      }
    } catch (e) {
      print("Error getting daily weather for $city: $e");
      throw e;
    }
  }
}
