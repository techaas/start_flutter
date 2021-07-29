// Copyright 2021, Techaas.com. All rights reserved.
//
import 'package:flutter/material.dart';

import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final List<String> images = [
    'images/1.jpeg',
    'images/2.jpeg',
    'images/3.jpeg',
    'images/4.jpeg',
    'images/5.jpeg',
    'images/6.jpeg',
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _imageIndex = 0;
  double _opacity = 1;

  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 5),
      _onTimer,
    );
    super.initState();
  }

  void _onTimer(Timer timer) {
    setState(() => _opacity = 0);
    Future.delayed(
        Duration(milliseconds: 500),
        () => setState(() {
              _imageIndex = (_imageIndex < widget.images.length - 1) ? _imageIndex + 1 : 0;
              _opacity = 1;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 500),
          child: Image.asset(widget.images[_imageIndex]),
        ),
      ),
    );
  }
}
