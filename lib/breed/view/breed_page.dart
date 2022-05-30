import 'package:doggos/breed/breed.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({
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
            child: Column(
              children: [
                const Text('You can select 3 of all options'),
                Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: List.generate(
                    10,
                    (index) => DogImage(breed: breed),
                  ),
                )
              ],
            ),
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
        child: SafeArea(
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
              const Text(
                '14,99€',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Icon(Icons.expand_less_outlined),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  padding: const EdgeInsets.all(5),
                  child: const CustomButton(title: 'CONTINUE'),
                ),
              ),
              HorizontalSpacer.semi(),
            ],
          ),
        ),
      ),
    );
  }
}
