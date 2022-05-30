import 'package:doggos/home/home.dart';
import 'package:http/http.dart' as http;

class DogsProvider {
  DogsProvider({required http.Client client}) {
    _client = client;
  }

  late final http.Client _client;

  Future<http.Response> getDoggos() async {
    final request = _client.get(Uri.parse(DogsEndpoints.allBreedsEndpoint));

    final response = await request;
    return response;
  }

  Future<http.Response> getPhotos(String breed) async {
    final request = _client.get(Uri.parse(DogsEndpoints.imageEnpoint(breed)));

    final response = await request;
    return response;
  }
}
