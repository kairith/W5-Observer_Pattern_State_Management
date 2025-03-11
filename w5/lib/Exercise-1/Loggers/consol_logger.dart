import '/Exercise-1/ride_pref.dart';
import '/Exercise-1/services/ride_pref_listener.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print('Preference changed: $selectedPreference');
  }
}
