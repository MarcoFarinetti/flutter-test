import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Event extends StatelessWidget {
  const Event({Key key, this.latLng}) : super(key: key);

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: TextFormField(
      decoration: InputDecoration(labelText: 'Nome evento'),
    ));
  }
}
