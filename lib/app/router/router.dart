import 'package:doggos/app/app.dart';
import 'package:doggos/breed/breed.dart';
import 'package:doggos/home/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static GoRouter router() {
    return GoRouter(
      routes: [
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
          ),
          routes: [
            GoRoute(
              path: '${AppRoutes.breed.path}/:bid',
              builder: (context, state) {
                final breed = state.params['bid']!;

                return BreedPage(breed: breed);
              },
            ),
          ],
        ),
      ],
    );
  }
}
