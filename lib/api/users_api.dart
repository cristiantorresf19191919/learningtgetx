import 'package:dio/dio.dart';
import 'package:getx_demo/models/user.dart';

class UsersApi {
  UsersApi._internal();
  static UsersApi _instance = UsersApi._internal();
  static UsersApi get instance => _instance;

  final dio = Dio();

  Future<List<User>?> getUsers(int page) async {
    try {
      final response = await dio.get('https://reqres.in/api/users',
          queryParameters: {"page": page, "delay": 5});

      final usersData = response.data['data'] as List;
      final usersResponse = List<User>.from(usersData.map((e) {
        try {
          final userInstance = User.fromJsonFact(e);
          return userInstance;
        } catch (e) {
          print(e);
        }
      }));
      return usersResponse;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
