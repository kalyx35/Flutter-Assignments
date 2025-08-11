import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Bengaluru coordinates
  static const double _lat = 12.9716;
  static const double _lon = 77.5946;

  Future<double?> fetchCurrentTemperature() async {
    final url = Uri.parse(
        'https://api.open-meteo.com/v1/forecast?latitude=$_lat&longitude=$_lon&current_weather=true&temperature_unit=celsius');
    final res = await http.get(url);
    if (res.statusCode != 200) return null;
    final json = jsonDecode(res.body);
    if (json == null) return null;
    final current = json['current_weather'];
    if (current == null) return null;
    final temp = (current['temperature'] as num?)?.toDouble();
    return temp;
  }
}
