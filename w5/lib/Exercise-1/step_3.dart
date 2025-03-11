import 'package:flutter/material.dart';
import '/Exercise-1/Loggers/consol_logger.dart';
import '/Exercise-1/ride_pref.dart';
import '/Exercise-1/services/ride_pref_service.dart';


void main() {
  RidePreferencesService ridePreferencesService = RidePreferencesService();
  ConsoleLogger consoleLogger = ConsoleLogger();

  // Register ConsoleLogger as a listener
  ridePreferencesService.addListener(consoleLogger);

  // Simulate a preference change
  ridePreferencesService.setCurrentPreference(RidePreference.defaultPreference);

}
