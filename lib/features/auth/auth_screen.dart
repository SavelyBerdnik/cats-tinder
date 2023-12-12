import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login Page'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: const EdgeInsets.all(10.0),
                    hintStyle: TextStyle(
                      color: Colors.blueGrey, fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      contentPadding: const EdgeInsets.all(10.0),
                      hintStyle: TextStyle(
                          color: Colors.blueGrey, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
              MaterialButton(
                  color: Colors.redAccent,
                  child: const Text('Login',),
                  onPressed: () async {
                    final pref = await SharedPreferences.getInstance();
                    pref.setString('email', emailController.text);
                    pref.setString('email', emailController.text);
                  })
            ],
          ),
        ),
      ),
    );
  }
}