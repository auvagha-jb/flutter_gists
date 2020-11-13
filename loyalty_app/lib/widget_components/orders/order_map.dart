import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shop_ke/helpers/maps/maps_helper.dart';

class OrderMap extends StatefulWidget {
  @override
  _OrderMapState createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    try {
      final locationData = await Location().getLocation();
      final staticMapImageUrl = MapsHelper.getLocationPreview(
          latitude: locationData.latitude, longitude: locationData.longitude);
      print(locationData.latitude);
      print(locationData.longitude);

      MapsHelper.getAddress(
          latitude: locationData.latitude, longitude: locationData.longitude);

      setState(() {
        _previewImageUrl = staticMapImageUrl;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? Center(
                  child: Text(
                    'No location chosen',
                    textAlign: TextAlign.center,
                  ),
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () => _getCurrentUserLocation(),
              icon: Icon(Icons.location_on,
                  color: Theme.of(context).primaryColor),
              label: Text(
                'Current Location',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            FlatButton.icon(
              onPressed: null,
              icon: Icon(Icons.map, color: Theme.of(context).primaryColor),
              label: Text(
                'Select on map',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
