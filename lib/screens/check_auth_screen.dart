import 'package:flutter/material.dart';
import 'package:products_app_flutter/screens/screens.dart';
import 'package:products_app_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({Key? key}) : super(key: key);

  static const routeName = 'CheckAuth';

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: authService.readToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data == '') {
              Future.microtask(
                () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 0),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              );
            } else {
              Future.microtask(
                () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 0),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const HomeScreen();
                      },
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
