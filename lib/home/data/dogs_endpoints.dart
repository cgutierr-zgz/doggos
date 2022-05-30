abstract class DogsEndpoints {
  static const _baseUrl = 'https://dog.ceo/api';

  static const allBreedsEndpoint = '$_baseUrl/breeds/list/all';
  static String imageEnpoint(String breed) => '$_baseUrl/breed/$breed/images/';
}
