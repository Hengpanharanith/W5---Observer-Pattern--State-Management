import 'package:your_project_name/model/ride/locations.dart';
import '../model/ride_pref/ride_pref.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference selectedPreference);
}

class RidePreferencesService {
  final List<RidePreferencesListener> _listeners = [];
  RidePreference? _currentPreference;

  void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
  }

  void removeListener() {
    _listeners.removeLast();
  }

  void notifyListeners() {
    if (_currentPreference == null) return;
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_currentPreference!);
    }
  }

  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    notifyListeners();
  }
}

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference selectedPreference) {
    print('ConsoleLogger: Ride preference selected: $selectedPreference');
  }
}

void main() {
  RidePreferencesService riderservice1 = RidePreferencesService();
  RidePreferencesService riderservice2 = RidePreferencesService();

  riderservice1.addListener(ConsoleLogger());
  riderservice1.setCurrentPreference(RidePreference(
      departure: Location(name: 'Siem Reap', country: Country.cambodia),
      arrival: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now(),
      requestedSeats: 1));

  riderservice2.addListener(ConsoleLogger());
  riderservice2.setCurrentPreference(RidePreference(
    departure: Location(name: 'Kompot', country: Country.cambodia),
    arrival: Location(name: 'Battambang', country: Country.cambodia),
    departureDate: DateTime.now(),
    requestedSeats: 1));
    //remove rideservice1

}
