import 'dart:developer';

class LocationHelper {
  static String getLong(String location) {
    String long = '';
    location = location.split('LNG:').last;
    long = location;
    log("long $long");
    return long;
  }

  static String getLat(String location) {
    String lat = '';
    location = location.split('LAT:').last.split(',LNG:').first;
    lat = location;
    log("lat $lat");
    return lat;
  }
}
