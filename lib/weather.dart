// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'networking.dart';
import 'constants.dart';

class Weather extends StatefulWidget {
  Weather({
    this.locationweather,
  });
  final locationweather;

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late int temperature;
  late int dayTemp;
  late int nightTemp;
  late int mornTemp;
  late int eveTemp;

  late String condition;
  late String cityName;
  late String country;
  late String icon;
  late String conditionDescription;
  late String time;
  late String timeAmPm;
  late String day;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationweather);

    getdate();
  }

  updateUI(dynamic weatherData) {
    double temp = weatherData['current']['temp'];
    temperature = temp.toInt();
    condition = weatherData['current']['weather'][0]['main'];
    conditionDescription = weatherData['current']['weather'][0]['description'];
    // //country = weatherData['sys']['country'];
    cityName = weatherData['timezone'];
    icon = weatherData['current']['weather'][0]['icon'];
    double dayTemperature = weatherData['daily'][0]['temp']['day'];
    dayTemp = dayTemperature.toInt();
    double nightTemperature = weatherData['daily'][0]['temp']['night'];
    nightTemp = nightTemperature.toInt();
    double mornTemperature = weatherData['daily'][0]['temp']['morn'];
    mornTemp = mornTemperature.toInt();
    double eveTemperature = weatherData['daily'][0]['temp']['eve'];
    eveTemp = eveTemperature.toInt();

    // print(temperature);
    // print(condition);
    // print(cityName);
    // print(dayTemp);
    // print(eveTemp);
    // print(mornTemp);

    // print(nightTemp);
  }

  getdate() {
    var date = DateTime.now();
    print(date.toString()); // prints something like 2019-12-10 10:02:22.287949
    day = (DateFormat('EEEE').format(date)); // prints Tuesday
    // print(DateFormat('EEEE, d MMM, yyyy')
    //     .format(date)); // prints Tuesday, 10 Dec, 2019
    time = (DateFormat('h:mm').format(date)); //
    timeAmPm = (DateFormat(' a').format(date)); //
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(
                top: 60.0, right: 15.0, left: 15.0, bottom: 5.0),
            child: Column(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$day'.toUpperCase(),
                    style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$time',
                        style: TextStyle(
                            letterSpacing: -2,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        '$timeAmPm',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Image.network(
                'http://openweathermap.org/img/wn/$icon@4x.png',
                scale: 0.68,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          "$temperature" + "\u00b0" + "c",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 100.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$cityName',
                      style: TextStyle(
                          letterSpacing: 8,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  children: [
                    Text(
                      condition.toUpperCase(),
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '$conditionDescription',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        'Morn',
                        style: kDayforecastTextStyle,
                      ),
                      Text(
                        "$mornTemp" + "\u00b0" + "c",
                        style: kWeatherforecastTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Aft',
                        style: kDayforecastTextStyle,
                      ),
                      Text(
                        "$dayTemp" + "\u00b0" + "c",
                        style: kWeatherforecastTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Eve',
                        style: kDayforecastTextStyle,
                      ),
                      Text(
                        "$eveTemp" + "\u00b0" + "c",
                        style: kWeatherforecastTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Night',
                        style: kDayforecastTextStyle,
                      ),
                      Text(
                        "$nightTemp" + "\u00b0" + "c",
                        style: kWeatherforecastTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
