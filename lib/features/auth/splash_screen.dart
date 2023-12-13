// import 'dart:async';
// import 'dart:convert';
// import 'package:cats_tinder/domain/model/user_model.dart';
// import 'package:cats_tinder/features/auth/auth_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
//
// String finalEmail;
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   static const userModelKey = 'userModel';
//   @override
//   void initState() {
//     getAuth().whenComplete(() async {
//       Timer(const Duration(seconds: 2), () => Get.to(finalEmail == null ? LoginPage(): HomePage()));
//     });
//     super.initState();
//   }
//
//   Future getAuth() async {
//     var prefs = await SharedPreferences.getInstance();
//     var obtainedEmail = prefs.getString('email');
//     setState(() {
//       finalEmail = obtainedEmail;
//     });
//     print(finalEmail);
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(),
//             const Column(
//               children: [
//                 Text('Cats Tinder',
//                     style: TextStyle(color: Colors.white, fontSize: 40)),
//               ],
//             ),
//             const Text('powered by S.Berdnikov',
//                 style: TextStyle(color: Colors.white)),
//           ],
//         ),
//       ),
//     );
//   }
// }
