import 'package:flutter/material.dart';
import 'package:products_app_flutter/services/services.dart';
import 'package:provider/provider.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class ProductApp extends StatelessWidget {
  const ProductApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
      ],
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ProductApp",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.getAppRoutes,
      theme: AppTheme.lightTheme,
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}
