import 'dart:convert';
import 'dart:html';


import 'package:http/http.dart' as http;
import 'package:map_app/data/data_constants.dart';
import 'package:map_app/model/city.dart';
import 'package:map_app/model/weather.dart';

import 'api_repository.dart';


class ApiImpl extends ApiRepository {
  @override
  Future<List<City>> getCities(String text) async {
    dynamic url = '${api}search/?query=$text';
    dynamic response = await http.get(url);
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body) as List;
    final cities = data.map((e) => City.fromJson(e)).toList();
    return cities;
  }

  @override
  Future<City> getWeathers(City city) async {
    dynamic url = '$api${city.id}';
    dynamic response = await http.get(url);
    final body = Utf8Decoder().convert(response.bodyBytes);
    final data = jsonDecode(body);
    final weatherData = data['consolidated_weather'] as List;
    final weathers = weatherData.map((e) => Weather.fromJson(e)).toList();
    final newCity = city.fromWeathers(weathers);
    return newCity;
  }
}
