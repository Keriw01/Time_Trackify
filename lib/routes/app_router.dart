import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:time_trackify/pages/auth/login_page.dart';
import 'package:time_trackify/pages/qr_page.dart';
import 'package:time_trackify/pages/auth/register_page.dart';
import 'package:time_trackify/pages/authentication_flow_screen.dart';
import 'package:time_trackify/pages/statistics_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthenticationFlowRoute.page,
          initial: true,
          children: [
            AutoRoute(page: QrRoute.page),
            AutoRoute(page: StatisticsRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegistrationRoute.page),
      ];
}
