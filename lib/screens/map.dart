import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> {
  GoogleMapController mapController;

  Position _position;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    Geolocator().getLastKnownPosition().then((lastLocation) {
      if (lastLocation != null) {
        setState(() {
          _position = new Position(
              latitude: lastLocation.latitude,
              longitude: lastLocation.longitude);
        });
      } else {
        Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
            .then((currentLocation) {
          setState(() {
            _position = new Position(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude);
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_position == null) {
      return new Container();
    }
    return GoogleMap(
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: CameraPosition(
          target: LatLng(_position.latitude, _position.longitude), zoom: 11.0),
      onLongPress: createEvent,
    );
  }

  void createEvent(LatLng latLng) {
    showDialog(context: context, child: SimpleDialog(title: Text('Ciao'),));
  }

}
