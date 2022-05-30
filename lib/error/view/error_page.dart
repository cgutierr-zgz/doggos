import 'package:doggos/app/app.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.error});
  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Unkown Path'),
            Text(
              '$error',
              style: const TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
            ),
            VerticalSpacer.medium(),
            CustomButton(
              title: 'Go Home',
              onPressed: () => context.go(AppRoutes.home.path),
            ),
          ],
        ),
      ),
    );
  }
}
