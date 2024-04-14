import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_trackify/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:time_trackify/routes/app_router.dart';

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
            return AutoTabsRouter(
              routes: const [
                QrRoute(),
                StatisticsRoute(),
              ],
              builder: (context, child) {
                final tabsRouter = AutoTabsRouter.of(context);
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Time Trackify'),
                    actions: [
                      IconButton(
                        onPressed: () =>
                            context.router.navigate(const ProfileRoute()),
                        icon: const Icon(Icons.person),
                      )
                    ],
                  ),
                  body: child,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: (value) {
                      tabsRouter.setActiveIndex(value);
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.qr_code),
                        label: 'Scan QR',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart_sharp),
                        label: 'Statistics',
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return LoginPage();
        },
      ),
    );
  }
}
