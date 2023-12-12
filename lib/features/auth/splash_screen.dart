import 'dart:async';
import 'dart:convert';
import 'package:cats_tinder/domain/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const userModelKey = 'userModel';
  @override
  void initState() {
    super.initState();
  }

  Future getAuth() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.getString('email') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: [
                Text('Cats Tinder',
                    style: const TextStyle(color: Colors.white, fontSize: 40)),
              ],
            ),
            Text('powered by S.Berdnikov',
                style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
