import 'package:get/get.dart';
import 'package:getx_demo/api/users_api.dart';
import 'package:getx_demo/models/user.dart';

class HomeController extends GetxController {
  int _counter = 0;
  List<User> _users = [];
  bool _loading = true;

  int get counter => _counter;

  bool get loading => _loading;

  List<User> get users => _users;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("Same as initstate");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("On ready");
    loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersApi.instance.getUsers(1);
    _users = data!;
    _loading = false;
    update(['users']);
  }

  void increment() {
    _counter++;
    update(['text'], _counter <= 10);
  }
}
