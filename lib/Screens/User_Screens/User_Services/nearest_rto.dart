import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearestRTO extends StatefulWidget {
  const NearestRTO({super.key});

  @override
  State<NearestRTO> createState() => _NearestRTOState();
}

class _NearestRTOState extends State<NearestRTO> {
 final Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


List<Marker> marker = [
  Marker(markerId: MarkerId('1'),
  position: LatLng(10.3662, 76.2193))
];
      @override
      void initState() {
        super.initState();
        
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.hybrid,
        markers: Set<Marker>.of(marker),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label:const Text('Nearest RTO'),
        icon:const Icon(Icons.directions_boat),
      ),
    );
  }
   Future<void> _goToTheLake() async {
    final value= await _determinePosition();
    
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(10.3662, 76.2193),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414)));
  }

  Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;


  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {

      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {

    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 


  return await Geolocator.getCurrentPosition();
}
}


