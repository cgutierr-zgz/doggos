import 'package:doggos/app/app.dart';
import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomBackground(
      title: 'Choose',
      subTitle: 'your doggy',
      description: "Let's to complete the first steps",
      body: _HomeBody(),
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
                onChanged: (newValue) => context.read<HomeBloc>().add(
                      UpdateData(
                        breeds: state.breeds,
                        selectedValue: newValue!,
                      ),
                    ),
              ),
              VerticalSpacer.xLarge(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: CustomButton(
                  title: "Let's check!",
                  onPressed: () => context.push(
                    '/${AppRoutes.breed.path}/${state.selectedValue}',
                  ),
                ),
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
