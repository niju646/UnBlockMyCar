import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unblockmycar/core/utils/providers/get_providers.dart';
import 'package:unblockmycar/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp.router(
        title: "UnBlockMyCar",
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
