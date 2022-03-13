// https://www.metaweather.com/api/location/search/?query=ho
// https://www.metaweather.com/api/location/1252431/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

const baseUrl = 'https://www.metaweather.com/api';
final locationUrl = (String city) => '$baseUrl/location/search/?query=$city';
final weatherUrl = (int locationId) => '$baseUrl/location/$locationId';

class WeatherRepository {
  final http.Client httpClient;

  WeatherRepository({required this.httpClient});

  Future<int> getLocationIdFromCity(String city) async {
    final res = await httpClient.get(Uri(scheme: locationUrl(city)));
    if (res.statusCode != 200) {
      throw Exception('Error getLocationIdFromCity: $city');
    }

    final listCity = jsonDecode(res.body) as List;
    return (listCity.first)['woeid'] ?? 0;
  }

  Future<Weather> getWeatherByLocationId(int locationId) async {
    final res = await httpClient.get(Uri(scheme: weatherUrl(locationId)));
    if (res.statusCode != 200) {
      throw Exception('Error getWeatherByCityId: $locationId');
    }

    final weatherJson = jsonDecode(res.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeatherFromCity(String city) async {
    final locationId = await getLocationIdFromCity(city);
    return getWeatherByLocationId(locationId);
  }
}
