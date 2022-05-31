import 'package:doggos/app/app.dart';
import 'package:doggos/breed/breed.dart';
import 'package:doggos/breed/cubit/breed_cubit.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedCubit(),
      child: BreedView(breed: breed),
    );
  }
}

class BreedView extends StatelessWidget {
  const BreedView({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'What are your favorite dog races?',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: DogImages(breed: breed),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 125,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 5,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: BlocBuilder<BreedCubit, int>(
          builder: (context, state) {
            return SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalSpacer.semi(),
                  const GradientIcon(
                    icon: Icons.shopping_cart_outlined,
                    size: 40,
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.green,
                        AppColors.blue,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  Text(
                    '${(state * 5).toString()}€',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  const Icon(Icons.expand_less_outlined),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: CustomButton(
                        title: 'CONTINUE',
                        onPressed: state != 3
                            ? null
                            : () => context.go('/${AppRoutes.checkOut.path}'),
                      ),
                    ),
                  ),
                  HorizontalSpacer.semi(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
