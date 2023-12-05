import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:usermanagement/models/usermodel.dart';

class MapViewUser extends StatelessWidget {
  const MapViewUser({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    print(user.address!.geo!.lat);
    print(user.address!.geo!.lng);
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(user.address!.geo!.lat!),
                  double.parse(user.address!.geo!.lng!)),
              zoom: 15.0),
          markers: {
            Marker(
              markerId: const MarkerId("user_loc"),
              position: LatLng(double.parse(user.address!.geo!.lat!),
                  double.parse(user.address!.geo!.lng!)),
            ),
          },
        ),
      ],
    ));
  }
}
