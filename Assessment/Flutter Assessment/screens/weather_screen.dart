import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DailyWeather {
  final DateTime date;
  final String condition;
  final double maxTemp;
  final double minTemp;

  DailyWeather({
    required this.date,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });
}

class WeatherService {
  // Bengaluru coordinates
  static const double lat = 12.9716;
  static const double lon = 77.5946;

  Future<List<DailyWeather>> fetch7DayForecast() async {
    final url =
        'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&daily=weathercode,temperature_2m_max,temperature_2m_min&timezone=auto';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List dates = data['daily']['time'];
      final List maxTemps = data['daily']['temperature_2m_max'];
      final List minTemps = data['daily']['temperature_2m_min'];
      final List codes = data['daily']['weathercode'];

      return List.generate(dates.length, (i) {
        return DailyWeather(
          date: DateTime.parse(dates[i]),
          condition: _weatherCodeToString(codes[i]),
          maxTemp: maxTemps[i].toDouble(),
          minTemp: minTemps[i].toDouble(),
        );
      });
    } else {
      throw Exception('Failed to load weather');
    }
  }

  static String _weatherCodeToString(int code) {
    // Simplified mapping for demo
    if (code == 0) return 'Clear';
    if (code == 1 || code == 2) return 'Partly cloudy';
    if (code == 3) return 'Cloudy';
    if (code >= 51 && code <= 67) return 'Showers';
    if (code >= 71 && code <= 77) return 'Snow';
    if (code >= 80 && code <= 82) return 'Rain showers';
    if (code >= 95) return 'Thunderstorm';
    return 'Unknown';
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _service = WeatherService();
  late Future<List<DailyWeather>> _forecastFuture;

  @override
  void initState() {
    super.initState();
    _forecastFuture = _service.fetch7DayForecast();
  }

  IconData _iconForCondition(String condition) {
    switch (condition) {
      case 'Clear':
        return Icons.wb_sunny;
      case 'Partly cloudy':
        return Icons.cloud;
      case 'Cloudy':
        return Icons.cloud_queue;
      case 'Showers':
      case 'Rain showers':
        return Icons.water_drop;
      case 'Thunderstorm':
        return Icons.flash_on;
      case 'Snow':
        return Icons.ac_unit;
      default:
        return Icons.help_outline;
    }
  }

  String _monthName(int month) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather (Bengaluru)')),
      body: FutureBuilder<List<DailyWeather>>(
        future: _forecastFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Failed to load weather.'));
          }
          final forecast = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: forecast.length,
            itemBuilder: (context, index) {
              final day = forecast[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Icon(_iconForCondition(day.condition), size: 32, color: Theme.of(context).colorScheme.primary),
                  title: Text(
                    '${day.date.day.toString().padLeft(2, '0')} '
                    '${_monthName(day.date.month)} ${day.date.year}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    '${day.condition}  •  Max: ${day.maxTemp.toStringAsFixed(1)}°C  •  Min: ${day.minTemp.toStringAsFixed(1)}°C',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}