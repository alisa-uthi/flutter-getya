import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getya/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class DestinationMap extends StatefulWidget {
  final Function onChangeLocation;

  const DestinationMap({Key key, this.onChangeLocation}) : super(key: key);

  @override
  _DestinationMapState createState() => _DestinationMapState();
}

class _DestinationMapState extends State<DestinationMap> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng _initialPosition;
  final Set<Marker> _markers = {};
  bool _isLoading = false;
  List<Placemark> _placemarks;

  @override
  void initState() {
    super.initState();
    getUserPosition();
  }

  void getUserPosition() async {
    setState(() => _isLoading = true);

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      _initialPosition =
          LatLng(currentPosition.latitude, currentPosition.longitude);
    });
    _onAddMarkerButtonPressed(_initialPosition);

    setState(() => _isLoading = false);
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onAddMarkerButtonPressed(LatLng latLng) async {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    // Get place name
    _placemarks = await placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    widget.onChangeLocation(_placemarks);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Padding(
            padding: EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: kDefaultPadding),
                  Text("Loading your location...")
                ],
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: 300,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 15.0,
              ),
              markers: _markers,
              onTap: (latLng) {
                _onAddMarkerButtonPressed(latLng);
              },
            ),
          );
  }
}
