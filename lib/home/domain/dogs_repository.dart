import 'dart:convert';

import 'package:doggos/home/home.dart';
import 'package:doggos/utils/utils.dart';

class DogsRepository {
  DogsRepository({required DogsProvider dogsProvider}) {
    _dogsProvider = dogsProvider;
  }
  late final DogsProvider _dogsProvider;

  Future<List<String>> fetchBreeds() async {
    final response = await _dogsProvider.getDoggos();
    final json = jsonDecode(response.body) as Json;

    final breeds = <String>[];
    if (json['status'] == 'success') {
      json['message'].forEach((String k, dynamic v) => breeds.add(k));

      return breeds;
    } else if (json['status'] == 'error') {
      throw Exception(json['message']);
    } else {
      throw Exception(json['Some unkown error ocurred']);
    }
  }

  Future<String> fetchImage(String breed) async {
    final response = await _dogsProvider.getPhotos(breed);

    final json = jsonDecode(response.body) as Json;

    if (json['status'] == 'success') {
      return json['message'] as String;
    } else if (json['status'] == 'error') {
      throw Exception(json['message']);
    } else {
      throw Exception(json['Some unkown error ocurred']);
    }
  }
}
