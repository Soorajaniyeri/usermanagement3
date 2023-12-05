import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usermanagement/models/usermodel.dart';
import 'package:usermanagement/view_model/user_model_provider.dart';
import 'package:usermanagement/views/moreview.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<UserModelController>(context).showData();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue.shade300,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: obj,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<UserModel> userList = snapshot.data!;

            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final user = userList[index];

                  return UserViewWidget(user: user);
                });
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class UserViewWidget extends StatelessWidget {
  const UserViewWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.supervised_user_circle),
      title: Text(user.username!),
      subtitle: Column(
        children: [
          Row(
            children: [
              Text(user.name!),
            ],
          ),
          Row(
            children: [
              Text(user.email!),
            ],
          ),
        ],
      ),
      trailing: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserMoreView(user: user)));
          },
          icon: const Icon(Icons.arrow_forward)),
    );
  }
}
