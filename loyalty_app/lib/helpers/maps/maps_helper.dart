import 'package:geocoder/geocoder.dart';
import '../../constants.dart';

class MapsHelper {
  static String getLocationPreview({double latitude, double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${Constants
        .GOOGLE_MAPS_API_KEY}';
  }

  static getAddress({double latitude, double longitude}) async {
    // From coordinates
    final coordinates = new Coordinates(latitude, longitude);
    final addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    final first = addresses.first;
    print('${first.featureName} : ${first.addressLine}');
  }
}
