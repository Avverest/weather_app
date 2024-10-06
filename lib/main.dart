import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

String weatherApiKey = 'da0c8c237c4e3ff54d091a5a6a80b21a';

main() => runApp(MaterialApp(
  title: 'Weather',
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Weather'),
    ),
    body: const Center(
      child: App(),
    )
  )
));



class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  bool _isVisible = false;
  final TextEditingController _controller = TextEditingController();
  final WeatherFactory wf = WeatherFactory(weatherApiKey, language: Language.RUSSIAN);
  String _weatherData = 'Loading...';
  bool _isLoading = false;

  Future<void> fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
    });
    try {
      Weather w = await wf.currentWeatherByCityName(city);
      print(w);
      setState(() {
        _isVisible = true;
        _weatherData = '${w.temperature!.celsius}°C';
        _isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        _isVisible = false;
        _weatherData = 'Error fetching weather';
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !_isVisible ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            child: TextField(
              controller: _controller,
              onChanged: (String value) {
                setState(() {
                  _controller.text = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Введите город'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              fetchWeather(_controller.text);
            },
            child: _isLoading ? const SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(),
            ) : const Text('Погода!'),
          ),
        ],
      ) : Text(
        _weatherData,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
