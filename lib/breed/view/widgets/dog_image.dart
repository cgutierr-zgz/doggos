import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImage extends StatelessWidget {
  const DogImage({super.key, required this.breed});

  final String breed;

  @override
  Widget build(BuildContext context) {
    // TODO(carlos): This should be improved, obviously
    return FutureBuilder(
      future: context.read<HomeBloc>().fetchImage(breed),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              snapshot.data.toString(),
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          );
        } else {
          return Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(color: AppColors.green),
            ),
          );
        }
      },
    );
  }
}
