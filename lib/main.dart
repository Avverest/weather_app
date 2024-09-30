import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

String weatherApiKey = 'da0c8c237c4e3ff54d091a5a6a80b21a';

main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.ltr,
      child: CustomWeather('Kazan'),
    );
  }
}

class CustomWeather extends StatefulWidget {
  final String city;
  const CustomWeather(this.city, {super.key});

  @override
  State<CustomWeather> createState() => _CustomWeatherState();
}

class _CustomWeatherState extends State<CustomWeather> {
  final WeatherFactory wf = WeatherFactory(weatherApiKey);
  String _weatherData = 'Loading...';
  bool _isLoading = true;

  Future<void> fetchWeather() async {
    try {
      Weather w = await wf.currentWeatherByCityName(widget.city);
      print(w);
      setState(() {
        _weatherData = '${w.temperature!.celsius}°C';
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _weatherData = 'Error fetching weather';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ))
        : Text(
            _weatherData,
            style: const TextStyle(fontSize: 20.0),
          );
  }
}
