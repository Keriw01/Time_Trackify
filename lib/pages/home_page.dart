import 'package:auto_route/auto_route.dart';
import 'package:time_trackify/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            child: Text("LogOut"),
            onPressed: () => context.read<AuthBloc>().logOut()),
      ),
    );
  }
}
