import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moderan_weather_app/controllers/global_controller.dart';
import 'package:http/http.dart' as http;

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";
  String date = DateFormat("d MMM, y").format(DateTime.now());
  final GloalController gloalController =
      Get.put(GloalController(), permanent: true);

  @override
  void initState() {
    getAddress(gloalController.getLattitude().value,
        gloalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    final url = Uri.parse(
        'https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=$lat&longitude=$lon&localityLanguage=en');
    final response = await http.get(url);
    final data = jsonDecode(response.body);


    setState(() {
      city = data["locality"].toString();
    });
  }

  @override
  Widget build(BuildContext buildContext) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          alignment: Alignment.topLeft,
          child: Text(
            city,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: const TextStyle(
                fontSize: 15, color: Color.fromARGB(255, 145, 139, 139)),
          ),
        )
      ],
    );
  }
}
