import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Altima Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _smashed = false;
  double _left = 300;
  double _top = 200;

  Timer? _smashedTimer;

  final NetworkImage _intactAltima = NetworkImage('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT1E6kYE5_d9uoMa9N8cUPCsLpcM4RNss-wwzFsqqfmOfGFUJ9-');
  final AssetImage _smashedAltima = AssetImage('images/smashed-altima.jpeg');

  void _clickCar() {
    if (! _smashed) {
      setState(() {
        _smashed = true;
      });
      _smashedTimer = Timer(
        const Duration(milliseconds: 300),
        () {
          setState(() {
            _smashed = false;
            _left += 30;
            _top += 30;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            onTap: _clickCar,
            child: Image(
                image: _smashed ? _smashedAltima : _intactAltima as ImageProvider<Object>,
                height: 200,
                width: 200),
          ),
        )
      ],
    );
  }
}
