import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_trackify/pages/home_page.dart';
import 'package:time_trackify/pages/login_page.dart';
import 'package:time_trackify/pages/register_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
