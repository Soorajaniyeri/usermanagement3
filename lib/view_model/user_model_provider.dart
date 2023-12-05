import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/usermodel.dart';

class UserModelController extends ChangeNotifier {
  Future<List<UserModel>> showData() async {
    Response res =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    try {
      if (res.statusCode == 200) {
        List<dynamic> data = jsonDecode(res.body);
        List<UserModel> userList =
            data.map((user) => UserModel.fromJson(user)).toList();
        return userList;
      } else {
        throw 'failed to load data${res.statusCode}';
      }
    } catch (error) {
      throw 'failed to load data';
    }
  }
}
