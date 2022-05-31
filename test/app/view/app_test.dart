import 'package:doggos/app/app.dart';
import 'package:doggos/home/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  group('App', () {
    late HomeBloc homeBloc;
    setUp(() {
      final client = http.Client();
      homeBloc = HomeBloc(
        dogsRepository: DogsRepository(
          dogsProvider: DogsProvider(client: client),
        ),
      );
    });

    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        BlocProvider.value(
          value: homeBloc,
          child: const App(),
        ),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
