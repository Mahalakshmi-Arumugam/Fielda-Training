import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
          title: 'Flutter Demo Home Page', key: ValueKey("myHomePage")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rating = 5.0;
  String _currentAnimation = '5+';

  void _onChanged(double value) {
    if (_rating == value) return;

    setState(() {
      var direction = _rating < value ? '+' : '-';
      _rating = value;
      _currentAnimation = '${value.round()}$direction';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: 300,
              child: FlareActor(
                'assets/happiness_emoji.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: _currentAnimation,
              ),
            ),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              onChanged: _onChanged,
            ),
            Text(
              '$_rating',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
