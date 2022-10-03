import 'package:dio/dio.dart';

import 'model.dart';

class ApiUser {
  ApiUser();
  Future<User?> getHttp() async {
    try {
      var response = await Dio().get('https://rickandmortyapi.com/api/character/');
      Map<String,dynamic> post = response.data;
      final posts = User.fromJson(post);
      return posts;
    } catch (e) {
      print(e);
    }
  }
}