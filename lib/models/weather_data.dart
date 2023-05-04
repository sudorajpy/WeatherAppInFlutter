import 'package:moderan_weather_app/models/weather_data_daily.dart';
import 'package:moderan_weather_app/models/weather_data_current.dart';
import 'package:moderan_weather_app/models/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  //function to fetch current
  WeatherDataCurrent weatherDataCurrent() => current!;
  //function to fetch hourly
  WeatherDataHourly weatherDataHourly() => hourly!;
  //function to fetch daily
  WeatherDataDaily weatherDataDaily() => daily!;
}
