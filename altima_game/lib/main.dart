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
  double _left = 300;
  double _top = 200;

  void _clickCar() {
    setState(() {
      _left += 50;
      _top += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Image.network(
                'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcT1E6kYE5_d9uoMa9N8cUPCsLpcM4RNss-wwzFsqqfmOfGFUJ9-',
                height: 200,
                width: 200),
                onTap: _clickCar,
          ),
        )
      ],
    );
  }
}
