import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unblockmycar/features/home/data/presentation/call_detail_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/car_detail_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/history_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/home_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/notification_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/notify_screen.dart';
import 'package:unblockmycar/features/home/data/presentation/profile_screen.dart';
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
    pageBuilder: (context, state) {
      final vehicleNUmber = state.extra as String;
      return CustomTransitionPage(
        key: state.pageKey,
        child: CarDetailScreen(vehicleNumber: vehicleNUmber),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    },
  ),

  //notify screen
  GoRoute(
    path: '/notifyScreen',
    name: RouterConstants.notifyScreen,
    pageBuilder: (context, state) {
      final vehicleNumber = state.extra as String;
      return CustomTransitionPage(
        key: state.pageKey,
        child: NotifyScreen(vehicleNumber: vehicleNumber),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    },
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

  //calling screen
  GoRoute(
    path: '/callingScreen',
    name: RouterConstants.callingScreen,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const CallScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    ),
    builder: (context, state) => CallScreen(),
  ),
];
