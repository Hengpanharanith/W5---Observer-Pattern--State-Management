import '../model/ride_pref/ride_pref.dart';
import '../repository/ride_preferences_repository.dart';

/// Abstract listener for ride preferences changes
abstract class RidePreferenceListener {
  void onRidePreferenceChanged(RidePreference preference);
}

class RidePrefService {
  // Static private instance
  static RidePrefService? _instance;
  final List<RidePreferenceListener> _listeners = [];
  final RidePreferencesRepository repository;
  RidePreference? _currentPreference;

  // Private constructor
  RidePrefService._internal(this.repository);

  // Add listener to the list
  void addListener(RidePreferenceListener listener) {
    _listeners.add(listener);
  }

  // Remove listener from the list
  void removeListener(RidePreferenceListener listener) {
    _listeners.remove(listener);
  }

  // Notify all listeners
  void notifyListeners() {
    if (_currentPreference == null) return;
    for (var listener in _listeners) {
      listener.onRidePreferenceChanged(_currentPreference!);
    }
  }

  // Update current preference and notify
  void setCurrentPreference(RidePreference preference) {
    _currentPreference = preference;
    print('Set current preference to: $_currentPreference');
    notifyListeners();
  }

  // Static initialization
  static void initialize(RidePreferencesRepository repository) {
    if (_instance == null) {
      _instance = RidePrefService._internal(repository);
    } else {
      throw Exception("RidePreferencesService is already initialized.");
    }
  }

  // Singleton accessor
  static RidePrefService get instance {
    if (_instance == null) {
      throw Exception(
          "RidePreferencesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }
}

// Console logger implementation
class ConsoleLogger implements RidePreferenceListener {
  @override
  void onRidePreferenceChanged(RidePreference preference) {
    print('🔔 ConsoleLogger: Ride preference changed: $preference');
  }
}

// Test implementation
void main() {
  // Initialize repository and service
  final repository = MockRidePreferencesRepository();
  RidePrefService.initialize(repository);

  // Create and register console logger
  final logger = ConsoleLogger();
  RidePrefService.instance.addListener(logger);

  // Test preference changes
  print('\n📝 Testing preference changes...');
  RidePrefService.instance.setCurrentPreference(RidePreference(
      departure: 'Phnom Penh', destination: 'Siem Reap', date: DateTime.now()));

  // Test another preference change
  print('\n📝 Testing another preference change...');
  RidePrefService.instance.setCurrentPreference(RidePreference(
      departure: 'Siem Reap',
      destination: 'Battambang',
      date: DateTime.now().add(Duration(days: 1))));
}
