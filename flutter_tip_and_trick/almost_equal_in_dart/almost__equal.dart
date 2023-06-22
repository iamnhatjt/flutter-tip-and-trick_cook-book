extension AlmostEqual on double {
  static const double positionEpsilon = 0.00001;
  bool almostEqualPosition(double other) =>
      (this - other).abs() < positionEpsilon;
}

class GeoPosition {
  final double latitude;
  final double longtitude;
  final bool exactMath;

  GeoPosition(
      {required this.latitude,
      required this.longtitude,
      bool exactMath = false})
      : this.exactMath = exactMath;

  @override
  bool operator ==(covariant GeoPosition other) {
    if (exactMath) {
      return latitude == other.latitude && longtitude == other.longtitude;
    }

    return latitude.almostEqualPosition(other.latitude) &&
        longtitude.almostEqualPosition(other.longtitude);
  }
}

void testIt() {
  final a = GeoPosition(latitude: 12.12340, longtitude: 12.12340);
  final b =
      GeoPosition(latitude: 12.12341, longtitude: 12.12341, exactMath: true);

  print(a == b); // true
  print(b == a); // false
}
