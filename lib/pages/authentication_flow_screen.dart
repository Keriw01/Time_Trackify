import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_trackify/pages/home_page.dart';
import 'package:time_trackify/pages/login_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
