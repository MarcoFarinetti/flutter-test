import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/event.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  MapState createState() => MapState();
}

class MapState extends State<Map> with AutomaticKeepAliveClientMixin {
  GoogleMapController _mapController;

  bool _isCreateEventButton = false;
  IconData _floatingButtonIcon = Icons.add;
  double _buttonHeight = 60;
  double _buttonWidth = 60;
  double _buttonIconSize = 25;
  MaterialColor _buttonColor = Colors.blue;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((currentLocation) {
      _mapController.animateCamera(CameraUpdate.newLatLng(
          LatLng(currentLocation.latitude, currentLocation.longitude)));
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Stack(children: <Widget>[
        GestureDetector(
//              onLongPressStart: createEventLongPress,
            onTap: _isCreateEventButton ? defaultButton() : null,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(0.0, 0.0), zoom: 11.0),
            )),
        Positioned(
            right: 10,
            bottom: 10,
            child: Container(
                height: _buttonHeight,
                width: _buttonWidth,
                child: FloatingActionButton(
                    child: Icon(
                      _floatingButtonIcon,
                      size: _buttonIconSize,
                    ),
                    backgroundColor: _buttonColor,
                    onPressed: () {
                      _isCreateEventButton
                          ? createEvent()
                          : createEventButton();
                    })))
      ]),
    );
  }

  createEventButton() {
    print("QUA");
    setState(() {
      _isCreateEventButton = true;
      _buttonHeight = 80;
      _buttonWidth = 80;
      _floatingButtonIcon = Icons.event;
      _buttonColor = Colors.cyan;
      _buttonIconSize = 45;
    });
  }

  defaultButton() {
    print("PORCO DIO");
    setState(() {
      _isCreateEventButton = false;
      _buttonHeight = 60;
      _buttonWidth = 60;
      _floatingButtonIcon = Icons.add;
      _buttonColor = Colors.blue;
      _buttonIconSize = 25;
    });
  }

  createEvent() {
    defaultButton();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Event()),
    );
  }

  void createEventLongPress(LongPressStartDetails details) {
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
                    MediaQuery.of(context)
                        .size
                        .height) // Bigger rect, the entire screen
            ));
  }

  @override
  bool get wantKeepAlive => true;
}
