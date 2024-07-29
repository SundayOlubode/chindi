class Location {
  final String streetAddress;
  final String suburb;
  final String city;
  final String county;

  const Location({
    required this.streetAddress,
    required this.suburb,
    required this.city,
    required this.county,
  });

  @override
  String toString() {
    return '$streetAddress, $suburb, $city, $county';
  }

  factory Location.fromMap(Map<String, dynamic> locationMap) {
    return Location(
      streetAddress: locationMap['streetAddress'] as String,
      suburb: locationMap['suburb'] as String,
      city: locationMap['city'] as String,
      county: locationMap['county'] as String,
    );
  }

  Map<String, String> toMap() {
    return {
      'streetAddress': streetAddress,
      'suburb': suburb,
      'city': city,
      'county': county,
    };
  }
}
