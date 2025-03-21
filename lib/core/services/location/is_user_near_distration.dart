import 'package:geolocator/geolocator.dart';
import 'dart:async';
 
import 'package:google_maps_flutter/google_maps_flutter.dart';
 

Future<bool> isUserNearDestination(
    double destinationLat, double destinationLng, double radiusInMeters ,LatLng userPosition) async {
  try {
    print("Getting user location...");
 
    print("User location: Lat: ${userPosition.latitude}, Lng: ${userPosition.longitude}");

    print("Destination location: Lat: ${destinationLat}, Lng: ${destinationLng}");
    print("Allowed radius: ${radiusInMeters} meters");
    
    print("Calculating distance to destination...");
    double distance = Geolocator.distanceBetween(
        userPosition.latitude, userPosition.longitude, destinationLat, destinationLng);
    print("Distance to destination: ${distance} meters");

    bool isNear = distance <= radiusInMeters;
    print(isNear 
        ? "User is near the destination (within ${radiusInMeters} meters)."
        : "User is not near the destination.");
    
    return isNear;
  } catch (e) {
    print("Error getting location: $e");
    return false;
  }
}