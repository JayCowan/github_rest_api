
import 'package:dio/dio.dart';
import 'package:github_rest_api/models/user.dart';

class Api {
  static Future<List<User>> rankUsers(List<User> users) async {
    try {
      StringBuffer buffer = StringBuffer();
      for (var element in users) {
        buffer.write(element.login);
        if (element != users.last) {
          buffer.write(',');
        }
      }
      Dio dio = Dio();
      var response = await dio.get(
        'http://0.0.0.0:8080/rank=${buffer.toString()}',
      );
      if (response.statusCode == 200) {
        List<User> ranking = <User>[];
        for (var user in response.data) {
          ranking.add(User.fromJson(user));
        }
        return ranking;
      } else {
        throw Exception(
            'Request failed with code: ${response.statusCode}, and message ${response.statusMessage}');
      }
    } on FormatException catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
