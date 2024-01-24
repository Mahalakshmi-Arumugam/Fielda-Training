// ignore_for_file: avoid_print, unnecessary_null_comparison, unnecessary_string_interpolations, unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/search_dialog.dart';
import 'package:weather/weather_api.dart';
import 'package:weather/weather_model.dart';

class LocationBasedWeather extends StatefulWidget {
  const LocationBasedWeather({Key? key}) : super(key: key);

  @override
  State<LocationBasedWeather> createState() => _LocationBasedWeatherState();
}

class _LocationBasedWeatherState extends State<LocationBasedWeather> {
  late String cityName;
  late String weatherDescription;
  late double temperature;
  late double windSpeed;
  late double humidity;
  late String currentDay;
  late String currentDate;
  late String currentMonth;
  late Map<String, List<Map<String, dynamic>>> dailyForecastData;
  TextEditingController searchController = TextEditingController();
  late String iconCode;

  Color getBackgroundColor() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    if (currentHour >= 12) {
      return Colors.purple.withOpacity(0.5);
    } else {
      return Colors.blue.withOpacity(0.5);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationAndFetchWeather();
    fetchCurrentDate();
  }

  void getLocationAndFetchWeather() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (position != null) {
        await fetchWeather(position.latitude, position.longitude);
        await fetchDailyWeather(position.latitude, position.longitude);
      } else {}
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  Future<void> fetchWeather(double latitude, double longitude) async {
    try {
      WeatherModel weather = await WeatherApi.fetchWeather(latitude, longitude);

      setState(() {
        cityName = weather.cityName;
        weatherDescription = weather.weatherDescription;
        temperature = weather.temperature;
        windSpeed = weather.windSpeed;
        humidity = weather.humidity;
        iconCode = weather.iconCode;
      });
    } catch (e) {
      print("Error getting weather data: $e");
    }
  }

  Future<void> fetchDailyWeather(double latitude, double longitude) async {
    try {
      Map<String, List<Map<String, dynamic>>> dailyData =
          await WeatherApi.fetchDailyWeather(latitude, longitude);

      setState(() {
        dailyForecastData = dailyData;
        print('Daily Forecast Data: $dailyForecastData');
      });
    } catch (e) {
      print("Error getting daily weather: $e");
    }
  }

  void fetchCurrentDate() {
    final now = DateTime.now();
    currentDay = DateFormat('EEEE').format(now);
    currentDate = DateFormat('d').format(now);
    currentMonth = DateFormat('MMMM').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 8),
                      Text(
                        '$cityName',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _showSearchDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor:
                          getBackgroundColor() == Colors.purple.withOpacity(0.5)
                              ? Colors.purple
                              : Colors.blue,
                      padding: const EdgeInsets.all(16),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '$currentDay, $currentDate $currentMonth',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:
                        getBackgroundColor() == Colors.purple.withOpacity(0.5)
                            ? Colors.purple
                            : Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: getBackgroundColor() == Colors.purple.withOpacity(0.5)
                      ? [
                          Colors.purple.withOpacity(0.8),
                          const Color.fromARGB(255, 175, 24, 186),
                        ]
                      : [
                          const Color.fromRGBO(17, 103, 215, 0.8),
                          const Color.fromARGB(255, 24, 95, 186),
                        ],
                  stops: const [0.104, 0.877],
                  begin: const Alignment(0.965, 0.5),
                  end: const Alignment(-0.965, -0.5),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              'https://openweathermap.org/img/w/$iconCode.png',
                              scale: 1.0,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              weatherDescription,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${temperature.toStringAsFixed(1)}°C',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Feels like ',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                Text(
                                  '${temperature.toStringAsFixed(1)}°C',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoContainer(
                          label: 'Humidity',
                          icon: Icons.water_drop,
                          value: '$humidity%',
                        ),
                        _buildInfoContainer(
                          label: 'Wind Speed',
                          icon: Icons.air,
                          value: '$windSpeed m/s',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Daily Weather Forecast
            const SizedBox(height: 20),
            const Text(
              'Daily Weather Forecast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            dailyForecastData != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: dailyForecastData.length,
                      itemBuilder: (context, index) {
                        String day = dailyForecastData.keys.elementAt(index);
                        List<Map<String, dynamic>> hourlyData =
                            dailyForecastData[day]!;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('EEEE, d MMMM yyyy')
                                  .format(DateTime.parse(day)),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: hourlyData
                                    .map(
                                      (data) => Container(
                                        width: 70,
                                        margin: const EdgeInsets.all(4.0),
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: getBackgroundColor() ==
                                                  Colors.purple.withOpacity(0.5)
                                              ? Colors.purple.withOpacity(0.7)
                                              : Colors.blue.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Column(
                                          children: [
                                            Text(
                                              DateFormat('h:mm a').format(
                                                  DateTime.parse(data['date'])),
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                            Image.network(
                                              'https://openweathermap.org/img/w/${data['iconCode']}.png',
                                              scale: 1.0,
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              '${data['temperature'].toStringAsFixed(1)}°C',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SearchDialog(
        searchController: searchController,
        onSearch: (enteredCity) async {
          await fetchWeatherByCity(enteredCity);
          await fetchDailyWeatherByCity(enteredCity);
        },
      ),
    );
  }

  Future<void> fetchWeatherByCity(String city) async {
    try {
      Map<String, dynamic> data = await WeatherApi.fetchWeatherByCity(city);

      setState(() {
        cityName = data['name'];
        weatherDescription = data['weather'][0]['description'];
        temperature = (data['main']['temp'] - 273.15);
        windSpeed = data['wind']['speed'];
        humidity = data['main']['humidity'].toDouble();
        iconCode = data['weather'][0]['icon'];
      });
    } catch (e) {
      print("Error getting weather data for $city: $e");
    }
  }

  Future<void> fetchDailyWeatherByCity(String city) async {
    try {
      Map<String, List<Map<String, dynamic>>> dailyData =
          await WeatherApi.fetchDailyWeatherByCity(city);

      setState(() {
        dailyForecastData = dailyData;
        print('Daily Forecast Data for $city: $dailyForecastData');
      });
    } catch (e) {
      print("Error getting daily weather for $city: $e");
    }
  }
}

Container _buildInfoContainer(
    {required String label, required IconData icon, required String value}) {
  return Container(
    width: 100,
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      color: getBackgroundColor() == Colors.purple.withOpacity(0.5)
          ? Colors.purple.withOpacity(0.1)
          : Colors.blue.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ),
  );
}

getBackgroundColor() {}
