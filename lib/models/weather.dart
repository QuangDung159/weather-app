import 'package:equatable/equatable.dart';

// {
// "id": 6129104567926784,
// "weather_state_name": "Showers",
// "weather_state_abbr": "s",
// "wind_direction_compass": "ESE",
// "created": "2022-03-13T07:39:46.742724Z",
// "applicable_date": "2022-03-13",
// "min_temp": 24.595,
// "max_temp": 34.91,
// "the_temp": 34.03,
// "wind_speed": 7.516887050987567,
// "wind_direction": 121.81684613239244,
// "air_pressure": 1008,
// "humidity": 56,
// "visibility": 9.34821890161457,
// "predictability": 73
// },

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Weather extends Equatable {
  final String id;
  final WeatherCondition weatherCondition;
  final String windDirectionCompass;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final double windSpeed;
  final double windDirection;
  final double airPressure;
  final double humidity;
  final double visibility;
  final double predictability;
  final String formattedCondition;
  final int locationId;
  final String location;

  const Weather(
      {required this.id,
      required this.windDirectionCompass,
      required this.created,
      required this.minTemp,
      required this.maxTemp,
      required this.theTemp,
      required this.windSpeed,
      required this.windDirection,
      required this.airPressure,
      required this.humidity,
      required this.visibility,
      required this.predictability,
      required this.weatherCondition,
      required this.formattedCondition,
      required this.locationId,
      required this.location});

  @override
  List<Object?> get props => [
        id,
        windDirectionCompass,
        created,
        minTemp,
        maxTemp,
        theTemp,
        windSpeed,
        windDirection,
        airPressure,
        humidity,
        visibility,
        predictability,
        weatherCondition,
        formattedCondition,
        locationId,
        location
      ];

  factory Weather.fromJson(dynamic jsonObject) {
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
        weatherCondition: _mapStringToWeatherCondition(
            consolidatedWeather['weather_state_abbr'].toString()),
        formattedCondition: consolidatedWeather['weather_state_abbr'],
        id: consolidatedWeather['id'],
        windDirectionCompass: consolidatedWeather['wind_direction_compass'],
        created: consolidatedWeather['created'],
        minTemp: consolidatedWeather['min_temp'],
        maxTemp: consolidatedWeather['max_temp'],
        theTemp: consolidatedWeather['the_temp'],
        windSpeed: consolidatedWeather['wind_speed'],
        windDirection: consolidatedWeather['wind_direction'],
        airPressure: consolidatedWeather['air_pressure'],
        humidity: consolidatedWeather['humidity'],
        visibility: consolidatedWeather['visibility'],
        predictability: consolidatedWeather['predictability'],
        locationId: jsonObject['woeid'],
        location: jsonObject['title']);
  }

  static WeatherCondition _mapStringToWeatherCondition(String abbr) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstorm,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
      'c': WeatherCondition.clear
    };
    return map[abbr] ?? WeatherCondition.unknown;
  }
}
