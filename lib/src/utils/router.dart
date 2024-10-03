import 'package:blog/src/feature/home/views/scrol.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../feature/home/views/home1.dart';
import '../feature/home/views/home2.dart';

final GoRouter router = GoRouter(
  initialLocation: Home1.routePath,
  routes: [
   
    GoRoute(
      path: Home1.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const Home1();
      },
    ),
     GoRoute(
      path: Home2.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const Home2();
      },
    ),
    GoRoute(
      path: ScrollPage.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const ScrollPage();
      },
    ),
    
  ],
);
