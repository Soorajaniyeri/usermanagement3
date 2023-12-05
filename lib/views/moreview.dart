import 'package:flutter/material.dart';
import 'package:usermanagement/models/usermodel.dart';
import 'package:usermanagement/views/mapview.dart';

class UserMoreView extends StatelessWidget {
  const UserMoreView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_on),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return MapViewUser(user: user);
              },
            ));
          }),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          "User Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              user.name!,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              user.username!,
              style: const TextStyle(fontSize: 17),
            ),
            const Divider(
              height: 20,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "user address & details",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(user.address!.street!),
            Text(user.address!.city!),
            Text(user.address!.zipcode!),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Company & details",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(user.company!.name!),
            Text(user.company!.catchPhrase!),
            Text(user.company!.bs!),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text("Latitude ${user.address!.geo!.lat!}"),
                Text("Longitude ${user.address!.geo!.lng!}"),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
