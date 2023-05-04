import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moderan_weather_app/models/weather_data_daily.dart';
import 'package:moderan_weather_app/utils/custome_colors.dart';

class DailyDataForcast extends StatelessWidget {
  final WeatherDataDaily? weatherDataDaily;
  const DailyDataForcast({super.key, this.weatherDataDaily});

  //string manipulation
  String getDay(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final dayName = DateFormat('EEE').format(date);
    return dayName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomeColors.dividerLine.withAlpha(150),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              "Next 7 Days",
              style:
                  TextStyle(fontSize: 20, color: CustomeColors.textColorBlack),
            ),
          ),
          const SizedBox(height: 10,),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: weatherDataDaily!.daily.length > 7
            ? 7
            : weatherDataDaily!.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                  height: 60,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Text(
                          getDay(weatherDataDaily!.daily[index].dt!),
                          style: const TextStyle(
                              fontSize: 16,
                              color: CustomeColors.textColorBlack),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                            "assets/weather/${weatherDataDaily!.daily[index].weather![0].icon}.png"),
                      ),
                      Text(
                          "${weatherDataDaily!.daily[index].temp!.min}°/${weatherDataDaily!.daily[index].temp!.max}°")
                    ],
                  )),
              const Divider(
                color: CustomeColors.dividerLine,
                thickness: 1,
              )
            ],
          );
        },
      ),
    );
  }
}
