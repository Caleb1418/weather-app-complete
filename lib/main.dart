import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_api.dart';
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
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    data = await client.getCurrentWeather("Cape Town");
  }

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
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                      "${data!.cityName}"),
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
                  additionalInformation("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}")
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
