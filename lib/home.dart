import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'networking.dart';
import 'location.dart';

const apikey = '96504c52c6474be325d69d4514700004';
const WeatherMapURL = 'https://api.openweathermap.org/data/2.5/onecall';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$WeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly&appid=$apikey&units=metric'
        // 'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric',
        );
    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Weather(
          locationweather: weatherData,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 13, 48),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weatheree',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 40.0,
              ),
            ),
            CircularProgressIndicator(
              color: Colors.yellowAccent,
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}


//  double temperature = decodedData['main']['temp'];
//       int condition = decodedData['weather'][0]['id'];
//       String cityName = decodedData['name'];

//       print(temperature);
//       print(condition);
//       print(cityName);