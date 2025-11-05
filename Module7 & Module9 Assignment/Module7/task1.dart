import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController cityController = TextEditingController();
  String temperature = '';
  String description = '';
  String cityName = '';
  bool isLoading = false;
  String errorMessage = '';

  static const String apiKey = 'c2267ecdd71ace0c9ad79068f16dd8de';
  late WeatherFactory wf;

  @override
  void initState() {
    super.initState();
    wf = WeatherFactory(apiKey);
  }

  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a city name';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      Weather weather = await wf.currentWeatherByCityName(city);

      setState(() {
        temperature = '${weather.temperature?.celsius?.round()}°C';
        description = weather.weatherDescription ?? '';
        cityName = weather.areaName ?? city;
        errorMessage = '';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: City not found or API issue';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App Demo'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : () => fetchWeather(cityController.text),
              child: isLoading
                  ? CircularProgressIndicator()
                  : Text('Get Weather'),style:ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.black),
            ),
            SizedBox(height: 20),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            if (cityName.isNotEmpty) ...[
              Text('Weather in $cityName', style: TextStyle(fontSize: 18)),
              Text(temperature, style: TextStyle(fontSize: 36)),
              Text(description),
            ],
          ],
        ),
      ),
    );
  }
}