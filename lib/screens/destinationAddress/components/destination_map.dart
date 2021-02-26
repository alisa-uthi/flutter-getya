import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DestinationMap extends StatefulWidget {
  @override
  _DestinationMapState createState() => _DestinationMapState();
}

class _DestinationMapState extends State<DestinationMap> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _initialPosition;
  final Set<Marker> _markers = {};
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserPosition();
  }

  void getUserPosition() async {
    setState(() => isLoading = true);

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _initialPosition =
          LatLng(currentPosition.latitude, currentPosition.longitude);
    });

    _onAddMarkerButtonPressed(_initialPosition);
    setState(() => isLoading = false);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onAddMarkerButtonPressed(LatLng latLng) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        infoWindow: InfoWindow(
          title: "Really cool place",
          snippet: "5 Star Rating",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            width: double.infinity,
            height: 300,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 11.0,
              ),
              markers: _markers,
              onTap: (latLng) {
                _onAddMarkerButtonPressed(latLng);
              },
            ),
          );
  }
}
