import 'package:doggos/app/app.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBackground(
      title: 'All',
      subTitle: 'Confirmed',
      description: 'The first step is finished!',
      body: _CheckOutBody(),
    );
  }
}

class _CheckOutBody extends StatelessWidget {
  const _CheckOutBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 100,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            size: 150,
            color: Colors.white,
          ),
        ),
        VerticalSpacer.medium20(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: CustomButton(
            title: 'Home',
            onPressed: () => context.go(AppRoutes.home.path),
          ),
        )
      ],
    );
  }
}
