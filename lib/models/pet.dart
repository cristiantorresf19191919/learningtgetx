//programcion reactiva
import 'package:get/get.dart';

class RxPet {
  final RxString name;
  final RxInt age;
  RxPet({required this.name, required this.age});
}

class Pet {
  late RxPet rx;

  Pet({required String name, required int age}) {
    rx = RxPet(name: name.obs, age: age.obs);
  }

  String get name => rx.name.value;
  int get age => rx.age.value;

  set name(String value) {
    rx.name.value = value;
  }

  set age(int age) {
    rx.age.value = age;
  }
  // Pet copyWith({String name = "", int age = 0}) {
  //   return Pet(age: age, name: name);
  // }
}
