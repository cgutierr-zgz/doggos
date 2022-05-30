import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        dogsRepository: DogsRepository(
          dogsProvider: DogsProvider(
            client: http.Client(),
          ),
        ),
      ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final d = DogsRepository(
      dogsProvider: DogsProvider(
        client: http.Client(),
      ),
    )..fetchBreeds();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBubble(),
          BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is ErrorState) {
                CustomSnackBar.error(message: state.exception.toString())
                    .show(context);
              }
            },
            builder: (context, state) {
              //if (state is LoadingState) {
              //  return Center(
              //    child: Column(
              //      mainAxisAlignment: MainAxisAlignment.center,
              //      children: [
              //        const CircularProgressIndicator(color: AppColors.green),
              //        VerticalSpacer.semi(),
              //        const Text(
              //          'Loading...',
              //          style: TextStyle(
              //            color: Colors.grey,
              //            fontWeight: FontWeight.w600,
              //          ),
              //        ),
              //      ],
              //    ),
              //  );
              //}
              return SafeArea(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.person_outline,
                          size: 50,
                          color: Colors.white,
                        ),
                        // TODO(carlos): Add Route
                        onPressed: () => throw UnimplementedError(),
                      ),
                    ),
                    VerticalSpacer.xLarge(),
                    const Title(),
                    const Spacer(),
                    const CustomDropdown(
                      title: 'City',
                      items: ['Barcelona', 'Madrid', 'Zaragoza'],
                      icon: Icons.place_outlined,
                    ),
                    VerticalSpacer.medium20(),
                    const CustomDropdown(
                      title: 'I wanna see a',
                      // TODO: Fetch
                      items: ['Dog1', 'Dog2', 'Dog3'],
                      icon: Icons.schedule_outlined,
                    ),
                    VerticalSpacer.xLarge(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: CustomButton(title: "Let's check!"),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  static const _color = Colors.white;
  static const _textStyle = TextStyle(
    color: _color,
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, color: _color),
            HorizontalSpacer.normal(),
            const Text('Choose', style: _textStyle)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('your doggy', style: _textStyle),
            HorizontalSpacer.normal(),
            const Icon(Icons.auto_awesome, color: _color),
          ],
        ),
        VerticalSpacer.medium(),
        const Text(
          "Let's to complete the first steps",
          style: TextStyle(
            color: _color,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
