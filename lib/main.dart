import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:usermanagement/view_model/user_model_provider.dart';
import 'package:usermanagement/views/userview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModelController>(
      create: (BuildContext context) {
        return UserModelController();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'user view app',
        theme: ThemeData(
          textTheme: GoogleFonts.actorTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserView(),
      ),
    );
  }
}
