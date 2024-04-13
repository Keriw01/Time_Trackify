import 'package:flutter/material.dart';
import 'package:time_trackify/pages/auth/bloc/auth_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/styles/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Create an instance of AppRouter
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // MultiBlocProvider for managing BLoCs
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(_appRouter, context),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => QrBloc(_appRouter, context),
          lazy: true,
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        title: 'Time Trackify',
        theme: customTheme,
      ),
    );
  }
}
