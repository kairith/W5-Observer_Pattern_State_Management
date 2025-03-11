import 'package:flutter/material.dart';
import '/Exercise-2/model/color_counter.dart';
import '/Exercise-2/screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // New change NotifierProvider in main
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: Home()),
      ),
    ),
  );
}
