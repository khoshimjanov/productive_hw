import 'package:flutter/material.dart';
import 'package:productive/features/authentication/presentation/login_screen.dart';
import 'package:productive/features/authentication/presentation/widgets/authenticated_user.dart';
import 'package:productive/features/home/home.dart';

import 'assets/theme/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Productive',
        theme: AppTheme.darkTheme(),
        navigatorKey: _navigatorKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (_) => const SizedBox(),
        ),
        home:  AuthenticatedUser(
          child: Builder(builder: (context) {
            if (AuthenticatedUser.maybeOf(context)?.user == null) {
              return const LoginScreen();
            } else {
              return const HomeScreen();
            }
          }),
        ),
      );
}
