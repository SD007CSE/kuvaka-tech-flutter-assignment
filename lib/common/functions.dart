import 'dart:math';

/// Moves from [lat], [lng] towards [lat2], [lng2] by [meters] distance.
/// Returns a Map with updated 'latitude' and 'longitude'.
Map<String, double> moveTowards(
    double lat, double lng, double lat2, double lng2, double meters) {
  const double earthRadius = 6378137.0; // meters

  // Convert to radians
  double latRad = lat * pi / 180;
  double lngRad = lng * pi / 180;
  double lat2Rad = lat2 * pi / 180;
  double lng2Rad = lng2 * pi / 180;

  // Bearing from point1 to point2
  double dLng = lng2Rad - lngRad;
  double y = sin(dLng) * cos(lat2Rad);
  double x = cos(latRad) * sin(lat2Rad) -
      sin(latRad) * cos(lat2Rad) * cos(dLng);
  double bearing = atan2(y, x);

  // Move "meters" towards that bearing
  double newLatRad =
      asin(sin(latRad) * cos(meters / earthRadius) +
          cos(latRad) * sin(meters / earthRadius) * cos(bearing));

  double newLngRad = lngRad +
      atan2(
          sin(bearing) * sin(meters / earthRadius) * cos(latRad),
          cos(meters / earthRadius) - sin(latRad) * sin(newLatRad));

  return {
    "latitude": newLatRad * 180 / pi,
    "longitude": newLngRad * 180 / pi,
  };
}
