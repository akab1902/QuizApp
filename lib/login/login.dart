import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizapp/services/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login")
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterLogo(
              size: 150,
            ),
            Flexible(
                child: LoginButton(
                  color: Colors.deepPurple,
                  icon: FontAwesomeIcons.userNinja,
                  text: "Continue as a Guest",
                  loginMethod: AuthService().anonLogin,
                ))
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final Function loginMethod;
  final IconData icon;
  final String text;

  const LoginButton({
    Key? key,
    required this.color,
    required this.loginMethod,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(
            icon,
            color: Colors.white,
            size: 20
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(24),
          backgroundColor: color
        ),
        onPressed: () => loginMethod,
        label: Text(text)
      )
    );
  }
}

