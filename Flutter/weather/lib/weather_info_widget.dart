import 'package:flutter/material.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String iconCode;
  final String weatherDescription;
  final double temperature;
  final double humidity;
  final double windSpeed;

  const WeatherInfoWidget({
    Key? key,
    required this.iconCode,
    required this.weatherDescription,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Feels like ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
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
    );
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

  Color getBackgroundColor() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;

    if (currentHour >= 12) {
      return Colors.purple.withOpacity(0.8);
    } else {
      return const Color.fromRGBO(17, 103, 215, 0.8);
    }
  }
}
