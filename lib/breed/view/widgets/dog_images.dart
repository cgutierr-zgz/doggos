import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogImages extends StatelessWidget {
  const DogImages({super.key, required this.breed});

  final String breed;

  @override
  Widget build(BuildContext context) {
    // TODO(carlos): Future scope -> Improve
    return FutureBuilder<List<dynamic>>(
      future: context.read<HomeBloc>().fetchImages(breed),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              const Text('You can select 3 of all options'),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: List.generate(snapshot.data!.length, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot.data![index].toString(),
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),
                  );
                }),
              ),
            ],
          );
        } else {
          return Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(50),
              width: 30,
              height: 30,
              child: const CircularProgressIndicator(color: AppColors.green),
            ),
          );
        }
      },
    );
  }
}
