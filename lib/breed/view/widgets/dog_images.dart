import 'package:doggos/breed/cubit/breed_cubit.dart';
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
                  return _DogImage(url: snapshot.data![index].toString());
                }),
              ),
            ],
          );
        } else {
          return const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(color: AppColors.green),
          );
        }
      },
    );
  }
}

class _DogImage extends StatefulWidget {
  const _DogImage({required this.url});
  final String url;

  @override
  State<_DogImage> createState() => _DogImageState();
}

class _DogImageState extends State<_DogImage> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.url,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
          if (isSelected)
            Positioned.fill(
              child: ColoredBox(
                color: AppColors.green.withOpacity(0.4),
                child: const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        final cubit = context.read<BreedCubit>();
        if (cubit.state < 3 || isSelected == true) {
          setState(() => isSelected = !isSelected);
          cubit.updateQuantity(isSelected ? 1 : -1);
        } else {
          CustomSnackBar.error(message: 'You can only select up to 3 options')
              .show(context);
        }
      },
    );
  }
}
