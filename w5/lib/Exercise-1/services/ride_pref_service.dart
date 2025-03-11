import '/Exercise-1/ride_pref.dart';
import '/Exercise-1/services/ride_pref_listener.dart';

class RidePreferencesService {
  // List of registered listeners
  final List<RidePreferencesListener> _listeners = [];

  // Current ride preference
  RidePreference? _currentPreference;

  // Getter for the current preference
  RidePreference? get currentPreference => _currentPreference;

  // Update and notify listeners about preference changes
  void setCurrentPreference(RidePreference newPreference) {
  print('🔄 Updating preference to: ${newPreference.name}'); // Debugging statement
  _currentPreference = newPreference;
  notifyListeners();
}


  // Add a listener
  void addListener(RidePreferencesListener listener) {
    if (!_listeners.contains(listener)) {
      _listeners.add(listener);
    }
  }

  // Remove a listener
  void removeListener(RidePreferencesListener listener) {
    _listeners.remove(listener);
  }

  // Notify all listeners about preference change
 void notifyListeners() {
  if (_listeners.isEmpty) {
    print(" No listeners found. Make sure you added a listener.");
  }
  
  for (var listener in _listeners) {
    print(" Notifying listener: $listener");
    listener.onPreferenceSelected(_currentPreference!);
  }
}

}
