import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> with AutomaticKeepAliveClientMixin {

  GoogleMapController _mapController;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((currentLocation) {
      _mapController.moveCamera(CameraUpdate.newLatLng(
          LatLng(currentLocation.latitude, currentLocation.longitude)));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
        onLongPressStart: createEvent,
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(0.0, 0.0), zoom: 11.0),
        ));
  }

  void createEvent(LongPressStartDetails details) {
    showMenu(
        context: context,
        elevation: 10.0,
        items: <PopupMenuEntry>[
          PopupMenuItem(
            value: 0,
            child: Row(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Icon(Icons.event),
                Text("Crea evento"),
              ],
            ),
          )
        ],
        position: RelativeRect.fromRect(
            details.globalPosition & Size(0, 0), // smaller rect, the touch area
            Offset.zero &
                Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height) // Bigger rect, the entire screen
            ));
  }

  @override
  bool get wantKeepAlive => false;

}
