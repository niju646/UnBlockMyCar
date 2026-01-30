import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/features/home/car_detail_screen.dart';
import 'package:unblockmycar/features/home/history_screen.dart';
import 'package:unblockmycar/features/home/home_screen.dart';
import 'package:unblockmycar/features/home/notification_screen.dart';
import 'package:unblockmycar/features/home/notify_screen.dart';
import 'package:unblockmycar/features/home/profile_screen.dart';
import 'package:unblockmycar/features/home/widgets/scanner_screen.dart';
import 'package:unblockmycar/routes/router_constants.dart';
import 'package:unblockmycar/shared/splash_screen.dart';

final List<GoRoute> commonRoutes = [
  GoRoute(
    path: '/',
    name: RouterConstants.splashScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SplashScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => SplashScreen(),
  ),

  //home screen
  GoRoute(
    path: '/homescreen',
    name: RouterConstants.homeScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => HomeScreen(),
  ),

  ///scanner screen
  GoRoute(
    path: '/scannerScreen',
    name: RouterConstants.scannerScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const ScannerScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => ScannerScreen(),
  ),

  //car details screen
  GoRoute(
    path: '/carDetailScreen',
    name: RouterConstants.carDetailScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const CarDetailScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => CarDetailScreen(),
  ),

  //notify screen
  GoRoute(
    path: '/notifyScreen',
    name: RouterConstants.notifyScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const NotifyScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => NotifyScreen(),
  ),

  //profile screen
  GoRoute(
    path: '/profileScreen',
    name: RouterConstants.profileScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const ProfileScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => ProfileScreen(),
  ),

  //profile screen
  GoRoute(
    path: '/notificationScreen',
    name: RouterConstants.notificationScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const NotificationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => NotificationScreen(),
  ),

  //history screen
  GoRoute(
    path: '/historyScreen',
    name: RouterConstants.historyScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const HistoryScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => HistoryScreen(),
  ),
];
