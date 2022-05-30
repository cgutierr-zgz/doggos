import 'package:flutter/material.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  Widget build(BuildContext context) {
    return Text(breed);
  }
}
