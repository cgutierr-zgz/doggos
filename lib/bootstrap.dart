import 'dart:async';
import 'dart:developer';

import 'package:doggos/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          BlocProvider(
            create: (context) => HomeBloc(
              dogsRepository: DogsRepository(
                dogsProvider: DogsProvider(
                  client: http.Client(),
                ),
              ),
            ),
            child: await builder(),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
