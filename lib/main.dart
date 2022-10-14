import 'package:flutter/material.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePageState(),
    );
  }
}

class _HomePageState extends StatefulWidget {
  const _HomePageState({super.key});

  @override
  State<_HomePageState> createState() => __HomePageStateState();
}

class __HomePageStateState extends State<_HomePageState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9F9F9),
        elevation: 0.0,
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          currentWeather(Icons.wb_sunny_rounded, "26.3", "Cape Town"),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Additional Information",
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(
            height: 20.0,
          ),
          additionalInformation("24", "2", "1012", "24.6")
        ],
      ),
    );
  }
}
