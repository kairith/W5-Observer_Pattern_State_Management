import 'package:flutter/material.dart';
import 'package:w5/Exercise-1/Loggers/consol_logger.dart';
import 'package:w5/Exercise-1/services/ride_pref_service.dart';
import 'package:w5/Exercise-1/ride_pref.dart'; 

void main() {
  final service = RidePreferencesService();
  final logger = ConsoleLogger();

  service.addListener(logger);  // ✅ MUST be added before setting preference

  service.setCurrentPreference(RidePreference(name: 'Eco Mode')); 
service.setCurrentPreference(RidePreference(name: 'Luxury Mode')); 

}

