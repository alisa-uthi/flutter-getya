// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:pedantic/pedantic.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:person/generated/i18n.dart';
// import 'package:person/models/location_data.dart';
// import 'package:person/scoped_models/main.dart';
// import 'package:person/shared/global_config.dart' as globals;
// import 'package:person/widgets/helpers/dialogue_helper.dart';
// import 'package:scoped_model/scoped_model.dart';

// final Geolocator _geolocator = Geolocator();
// LocationData _currentLocationData;
// Position _currentPosition;
// String _isoCountryCode = "";

// /// This method is used to get the current location of the person.
// ///
// Future<LocationData> getCurrentLocation(
//   BuildContext context, {
//   Position currentPosition,
//   // Will be overridden with false if called from PersonProfilePage and a new
//   // user is being added.
//   bool updateDatabase = true,
// }) async {
//   MainModel _model = ScopedModel.of(context);
//   String _address = "";
//   _currentLocationData = null;
//   try {
//     // Android shows a dialogue which automatically updates the location
//     // permissions settings.
//     assert(globals.configFromDatabase != null);
//     // Creates a new 'location' object ie. a new instance of this class in the geoloc package
//     _currentPosition = await _geolocator.getCurrentPosition(
//         desiredAccuracy: globals.configFromDatabase.locationAccuracy);
//     _address = await _getLocationAddress(
//         _currentPosition.latitude, _currentPosition.longitude);
//     _currentLocationData = LocationData(
//       latitude: _currentPosition.latitude,
//       longitude: _currentPosition.longitude,
//       address: _address,
//       isoCountryCode: _isoCountryCode,
//     );
//     // Update the person's current location unless this is a new
//     // user being created in the PersonProfilePage. In that case the form data
//     // created from this method will be used when the save button is pressed.
//     if (updateDatabase) {
//       assert(_currentLocationData != null);
//       unawaited(_model.updateCurrentLocation(_currentLocationData));
//     }
//     return _currentLocationData;
//   } catch (error) {
//     unawaited(
//       showAlertDialogue(
//         <Your dialogue>
//       ),
//     );
//     return null;
//   }
// }

// /// This method retrieves placemark data based on a latitude and longitude
// /// value pair. It then assembles the data items into an address suitable for
// /// display in the app and retains the ISO3166-2 Country code in a separate
// /// variable for later storage on the database against the person.
// ///
// /// ! The Geolocator package provides this data for free so there is no need
// /// ! to pay for the Google Geocoding API.
// ///
// Future<String> _getLocationAddress(double latitude, double longitude) async {
//   List<Placemark> newPlace =
//       await _geolocator.placemarkFromCoordinates(latitude, longitude);
//   Placemark placeMark = newPlace[0];
//   String name = placeMark.name;
//   // String subLocality = placeMark.subLocality;
//   String locality = placeMark.locality;
//   String administrativeArea = placeMark.administrativeArea;
//   // String subAdministrativeArea = placeMark.administrativeArea;
//   String postalCode = placeMark.postalCode;
//   String country = placeMark.country;
//   // String subThoroughfare = placeMark.subThoroughfare;
//   String thoroughfare = placeMark.thoroughfare;
//   _isoCountryCode = placeMark.isoCountryCode;
//   return "$name, $thoroughfare, $locality, $administrativeArea, $postalCode, $country";
// }
