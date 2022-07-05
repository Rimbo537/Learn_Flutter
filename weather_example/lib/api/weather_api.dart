import 'dart:convert';
import 'dart:developer';

import 'package:weather_example/models/weather_forecast_daily.dart';
import 'package:weather_example/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_example/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isSity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;
    if (isSity == true) {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters.cast<String, String>();
    } else {
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longtitude.toString(),
      };
      parameters = queryParameters;
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
