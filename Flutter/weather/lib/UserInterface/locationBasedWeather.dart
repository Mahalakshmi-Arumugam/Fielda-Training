// ignore_for_file: avoid_print, unnecessary_string_interpolations, deprecated_member_use, unnecessary_null_comparison, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

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

  Future<void> fetchWeather(double latitude, double longitude) async {
    const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        cityName = data['name'];
        weatherDescription = data['weather'][0]['description'];
        temperature = (data['main']['temp'] - 273.15);
        windSpeed = data['wind']['speed'];
        humidity = data['main']['humidity'].toDouble();
        iconCode = data['weather'][0]['icon'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  void getLocationAndFetchWeather() async {
    try {
      Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // ignore: unnecessary_null_comparison
      if (position != null) {
        await fetchWeather(position.latitude, position.longitude);
        await fetchDailyWeather(position.latitude, position.longitude);
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print("Error getting location: $e");
    }
  }

  void fetchCurrentDate() {
    final now = DateTime.now();
    currentDay = DateFormat('EEEE').format(now);
    currentDate = DateFormat('d').format(now);
    currentMonth = DateFormat('MMMM').format(now);
  }


  Future<void> fetchDailyWeather(double latitude, double longitude) async {
    try {
      const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> forecastList = jsonDecode(response.body)['list'];

        dailyForecastData = {};

        for (var forecast in forecastList) {
          String date = forecast['dt_txt'].toString();
          String day = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

          dailyForecastData.putIfAbsent(day, () => []);

          double temperature = forecast['main']['temp'] - 273.15;
          double humidity = forecast['main']['humidity'].toDouble();
          double windSpeed = forecast['wind']['speed'];
          iconCode = forecast['weather'][0]['icon'];

          dailyForecastData[day]!.add({
            'date':
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(date)),
            'temperature': temperature,
            'humidity': humidity,
            'windSpeed': windSpeed,
            'iconCode': iconCode,
          });
        }

        setState(() {
          print('Daily Forecast Data: $dailyForecastData');
        });
      } else {
        throw Exception('Failed to load daily weather data');
      }
    } catch (e) {
      print("Error getting daily weather: $e");
    }
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
                      padding: const EdgeInsets.all(16),
                      primary:
                          getBackgroundColor() == Colors.purple.withOpacity(0.5)
                              ? Colors.purple
                              : Colors.blue,
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
              height: 200,
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
                            // Icon(

                            //   color: Colors.white,
                            //   size: 30,
                            // ),
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
                                              style:
                                                  const TextStyle(fontSize: 12),
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
      builder: (context) => AlertDialog(
        title: const Text('Search Location'),
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40.0,
              width: 200.0,
              child: TextField(
                controller: searchController,
                style: const TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color:
                        getBackgroundColor() == Colors.purple.withOpacity(0.5)
                            ? Colors.purple
                            : Colors.blue,
                  ),
                  labelText: 'Search by City',
                  fillColor:
                      getBackgroundColor() == Colors.purple.withOpacity(0.5)
                          ? Colors.purple.withOpacity(0.1)
                          : Colors.blue.withOpacity(0.1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              String enteredCity = searchController.text;
              if (enteredCity.isNotEmpty) {
                await fetchWeatherByCity(enteredCity);
                await fetchDailyWeatherByCity(enteredCity);
              }
            },
            child: const Text('Search'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Future<void> fetchWeatherByCity(String city) async {
    const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        cityName = data['name'];
        weatherDescription = data['weather'][0]['description'];
        temperature = (data['main']['temp'] - 273.15);
        windSpeed = data['wind']['speed'];
        humidity = data['main']['humidity'].toDouble();
        iconCode = data['weather'][0]['icon'];
      });
    } else {
      throw Exception('Failed to load weather data for $city');
    }
  }

  Future<void> fetchDailyWeatherByCity(String city) async {
    try {
      const apiKey = '25ec1c422578d5b2f5aef5a7abd7fc2f';
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> forecastList = jsonDecode(response.body)['list'];

        dailyForecastData = {};

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

        setState(() {
          print('Daily Forecast Data for $city: $dailyForecastData');
        });
      } else {
        throw Exception('Failed to load daily weather data for $city');
      }
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


