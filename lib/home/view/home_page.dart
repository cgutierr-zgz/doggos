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
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const BackgroundBubble(),
          SafeArea(
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
                const _Title(),
                const Spacer(),
                const _HomeBody(),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

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

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ErrorState) {
          CustomSnackBar.error(message: state.exception.toString())
              .show(context);
        }
      },
      builder: (context, state) {
        if (state is LoadedState) {
          return Column(
            children: [
              const CustomDropdown(
                title: 'City',
                items: ['Barcelona', 'Madrid', 'Zaragoza'],
                icon: Icons.place_outlined,
              ),
              VerticalSpacer.medium20(),
              CustomDropdown(
                title: 'I wanna see a',
                items: state.breeds,
                icon: Icons.schedule_outlined,
              ),
              VerticalSpacer.xLarge(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: CustomButton(title: "Let's check!"),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Column(
            children: [
              const Text('Fetching data failed...'),
              VerticalSpacer.medium(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: CustomButton(
                  title: 'Retry?',
                  onPressed: () =>
                      context.read<HomeBloc>().add(const FetchData()),
                ),
              ),
            ],
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                color: AppColors.green,
              ),
              VerticalSpacer.semi(),
              const Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
