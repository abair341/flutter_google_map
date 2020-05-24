import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class G_Maps extends StatefulWidget {
  @override
  _G_MapsState createState() => _G_MapsState();
}

class _G_MapsState extends State<G_Maps> {
  GoogleMapController _googleMapController;

  final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(31.419882, 73.115433),
    zoom: 20.0,
  );


  final List<Marker> markers = [];

  addMarker(cordinate){
    int id = Random().nextInt(100);
    setState(() {
      markers.add(Marker(position: cordinate,markerId:MarkerId(id.toString()) ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        markers: markers.toSet(),
        onMapCreated: (_googleMapController) {
          setState(() {
            _googleMapController = _googleMapController;
            
          });
        },
        onTap: (cordinate) {
          _googleMapController.animateCamera(
            CameraUpdate.newLatLng(cordinate),            
          );
          addMarker(cordinate);
        },
      ),
    );
  }
}
