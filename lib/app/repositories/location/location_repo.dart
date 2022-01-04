import 'package:geolocator/geolocator.dart';
import 'package:kurs3_sabak8/app/services/location/location_service.dart';

class LocationRepo {
  Future<Position> getCurrentLocation() async {
    return await locationService.getCurrentLocation();
  }
}

final LocationRepo locationRepo = LocationRepo();
