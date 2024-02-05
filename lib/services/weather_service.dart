import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "ea0b5144290b4f4ca6825114240402";

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error , try later";
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception("oops there was an error , try later");
    }
  }
}
