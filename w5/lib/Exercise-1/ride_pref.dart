
class RidePreference {
  String name;

  static RidePreference defaultPreference = RidePreference(name: 'Default');

  RidePreference({required this.name});

  @override 
  String toString() => 'RidePreference: $name';

  
}