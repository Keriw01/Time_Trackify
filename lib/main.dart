import 'package:flutter/material.dart';
import 'package:time_trackify/pages/auth/bloc/auth_bloc.dart';
import 'package:time_trackify/pages/profile/bloc/profile_bloc.dart';
import 'package:time_trackify/pages/qr_scanner/bloc/qr_bloc.dart';
import 'package:time_trackify/routes/app_router.dart';
import 'package:time_trackify/styles/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
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
        BlocProvider(
          create: (context) => ProfileBloc(_appRouter, context),
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
