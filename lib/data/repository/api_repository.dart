import 'package:map_app/model/city.dart';
abstract class ApiRepository {
  Future<List<City>> getCities(String text);
  Future<City> getWeathers(City city);
}
