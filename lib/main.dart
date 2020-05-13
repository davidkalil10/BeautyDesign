import 'package:beautydesign/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Neutra',
        primaryColor: Color(0xffFA879E),
        accentColor: Color(0xffFA879E),
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));
