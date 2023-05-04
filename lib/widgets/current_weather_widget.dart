import 'package:flutter/material.dart';
import 'package:moderan_weather_app/models/weather_data_current.dart';
import 'package:moderan_weather_app/utils/custome_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({required this.weatherDataCurrent, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //temp area
        tempAreaWidget(),
        const SizedBox(
          height: 25,
        ),
        //more details- wind, humidity, cloudiness
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget tempAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png',
          height: 80,
          width: 80,
        ),
        Container(height: 50, width: 1, color: CustomeColors.dividerLine),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${weatherDataCurrent.current.temp!.toInt()}°",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 68,
                    color: CustomeColors.textColorBlack)),
            TextSpan(
                text: "${weatherDataCurrent.current.weather![0].description}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.grey))
          ]),
        )
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomeColors.dividerLine,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomeColors.dividerLine,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: CustomeColors.dividerLine,
                  borderRadius: BorderRadius.circular(15)),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.windSpeed!.toInt()} km/h",
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.clouds!.toInt()} %",
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: Text(
                "${weatherDataCurrent.current.humidity!.toInt()} %",
                style: const TextStyle(
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        )
      ],
    );
  }
}
