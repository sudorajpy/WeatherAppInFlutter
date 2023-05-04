import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderan_weather_app/controllers/global_controller.dart';
import 'package:moderan_weather_app/widgets/comfort_level.dart';
import 'package:moderan_weather_app/widgets/current_weather_widget.dart';
import 'package:moderan_weather_app/widgets/daily_data_forecast.dart';
import 'package:moderan_weather_app/widgets/header_widget.dart';
import 'package:moderan_weather_app/widgets/hourly_weather_widget.dart';
import 'package:moderan_weather_app/utils/custome_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //call the controller

  final GloalController gloalController =
      Get.put(GloalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => gloalController.checkLoading().isTrue
            ? const Center(child: CircularProgressIndicator())
            : Container(
              height:double.infinity,
              width: double.infinity,
              child: Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const HeaderWidget(),
                      const SizedBox(
                        height: 10,
                      ),
                      //current
                      CurrentWeatherWidget(
                        weatherDataCurrent:
                            gloalController.getData().weatherDataCurrent(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      //hourly
                      HourlyDataWidget(
                        weatherDataHourly:
                            gloalController.getData().weatherDataHourly(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //daily
                      DailyDataForcast(
                        weatherDataDaily:
                            gloalController.getData().weatherDataDaily(),
                      ),
                      Container(height: 1, color: CustomeColors.dividerLine),
                      const SizedBox(
                        height: 30,
                      ),
                      //comfort level
                      ComfortLevel(
                          weatherDataCurrent:
                              gloalController.getData().weatherDataCurrent()),
                    ],
                  ),
                ),
            )),
      ),
    );
  }
}
