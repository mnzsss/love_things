import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void navigateBeforeValidateUser(BuildContext context, var user) {
    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  Future<void> setUser(BuildContext context, UserModel? user) async {
    if (user != null) {
      final database = FirebaseDatabase.instance.ref();
      final userRef = database.child('users/' + user.id);

      await userRef.update(user.toMap());
      saveUser(user);
      _user = user;
    }

    navigateBeforeValidateUser(context, user);
  }

  Future<void> saveUser(UserModel user) async {
    final _instance = await SharedPreferences.getInstance();
    await _instance.setString("user", user.toJson());
  }

  Future<void> currentUser(BuildContext context) async {
    final _instance = await SharedPreferences.getInstance();

    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    if (_instance.containsKey('user')) {
      final json = _instance.get("user") as String;

      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
  }
}
