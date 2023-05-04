import 'package:flutter/material.dart';
import 'package:moderan_weather_app/models/weather_data_current.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:moderan_weather_app/utils/custome_colors.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;
  const ComfortLevel({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 2, bottom: 20),
          child: const Text("Comfort Level", style: TextStyle(fontSize: 20)),
        ),
        SizedBox(
          height: 190,
          child: Column(
            children: [
              Center(
                child: SleekCircularSlider(
                  min: 0,
                  max: 100,
                  initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                  appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        progressBarWidth: 12,
                        trackWidth: 12,
                        handlerSize: 0,
                      ),
                      infoProperties: InfoProperties(
                          bottomLabelText: "Humidity",
                          bottomLabelStyle: const TextStyle(
                            color: CustomeColors.textColorBlack,
                            fontSize: 20,
                          ),
                          mainLabelStyle: const TextStyle(
                            color: CustomeColors.textColorBlack,
                            fontSize: 30,
                          )),
                      animationEnabled: true,
                      size: 160,
                      customColors: CustomSliderColors(
                          hideShadow: true,
                          trackColor:
                              CustomeColors.firstGradientColor.withAlpha(100),
                          progressBarColors: [
                            CustomeColors.firstGradientColor,
                            CustomeColors.secondGradientColor
                          ])),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "Feels Like: ",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: CustomeColors.textColorBlack,
                        ),
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent.current.feelsLike}",
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: CustomeColors.textColorBlack,
                        ),
                      )
                    ]),
                  ),
                  Container(
                    height: 25,
                    width: 1,
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    color: CustomeColors.dividerLine,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                        text: "UV Index: ",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: CustomeColors.textColorBlack,
                        ),
                      ),
                      TextSpan(
                        text: "${weatherDataCurrent.current.uvIndex}",
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1,
                          color: CustomeColors.textColorBlack,
                        ),
                      )
                    ]),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
