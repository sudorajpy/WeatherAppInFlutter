import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moderan_weather_app/controllers/global_controller.dart';
import 'package:moderan_weather_app/models/weather_data_hourly.dart';
import 'package:moderan_weather_app/utils/custome_colors.dart';

// ignore: must_be_immutable
class HourlyDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
  HourlyDataWidget({super.key, required this.weatherDataHourly});

  // card index
  RxInt cardIndex = GloalController().getIndexOfCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          alignment: Alignment.topCenter,
          child: const Text("Today", style: TextStyle(fontSize: 18)),
        ),
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return Container(
      height: 160,
      
      
      margin: const EdgeInsets.only(left: 20, right: 20),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weatherDataHourly.hourly.length > 12
            ? 12
            : weatherDataHourly.hourly.length,
        itemBuilder: (context, index) {
          return Obx((() => GestureDetector(
              onTap: () => cardIndex.value = index,
              child: Container(
                width: 90,
                margin: const EdgeInsets.only( right: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: CustomeColors.dividerLine.withAlpha(150),
                        spreadRadius: 1,
                        blurRadius: 30,
                        offset:
                            const Offset(0, 5), // changes position of shadow
                      ),
                    ],
                    gradient: cardIndex.value == index
                        ? const LinearGradient(colors: [
                            CustomeColors.firstGradientColor,
                            CustomeColors.secondGradientColor
                          ])
                        : null),
                child: HourlyDetails(
                  index: index,
                  cardIndex: cardIndex.toInt(),
                  temp: weatherDataHourly.hourly[index].temp!,
                  timeStamp: weatherDataHourly.hourly[index].dt!,
                  weatherIcon:
                      weatherDataHourly.hourly[index].weather![0].icon!,
                ),
              ))));
        },
      ),
    );
  }
}

//hourly details class
class HourlyDetails extends StatelessWidget {
  final int temp;
  final int timeStamp;
  final String weatherIcon;
  final int index;
  final int cardIndex;

  const HourlyDetails(
      {super.key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon,
      required this.index,
      required this.cardIndex});

  String getTime(final timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String finalTime = DateFormat('jm').format(dateTime);
    return finalTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(getTime(timeStamp),
              style: TextStyle(
                  color: cardIndex == index ? Colors.white : Colors.black)),
        ),
        Container(
          height: 40,
          width: 40,
          margin: const EdgeInsets.all(5),
          child: Image.asset("assets/weather/$weatherIcon.png"),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: Text(
            "$temp°",
            style: TextStyle(
                fontSize: 18,
                color: cardIndex == index ? Colors.white : Colors.black),
          ),
        )
      ],
    );
  }
}
