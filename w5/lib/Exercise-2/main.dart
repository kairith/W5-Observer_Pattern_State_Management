import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/color_counter.dart'; // Import your CounterModel
import 'screen/home_screen.dart'; // Import Home screen

void main() {
  debugPrintRebuildDirtyWidgets = true; // debug logs
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}

