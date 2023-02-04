import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/user_models.dart';

class HomeController extends GetxController {
  List<Users> listUser = [];
  List<Users> user = [];
  List<Users> cariUsers = [];

  feachUser() async {
    String token =
        "6aeed75a9fc239b8af14b54ed30990aca60209e864354005ada1ea8387398d02";
    var dio = Dio();
    var response = await dio.get('https://gorest.co.in/public/v2/users',
        options: Options(headers: {"Authorization": "Bearer $token"}));

    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        List usersJson = response.data;
        List<Users> users = [];
        for (var userJson in usersJson) {
          users.add(Users.fromJson(userJson));
        }

        listUser = users;
        cariUsers = listUser;
        update();
      } else {
        throw "Gagal";
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  void searchUser(String cari) {
    List<Users> result = [];
    if (cari.isEmpty) {
      result = listUser;
    } else {
      result = listUser
          .where((us) => us.name!.toLowerCase().contains(cari.toLowerCase()))
          .toList();
    }
    cariUsers = result;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    cariUsers = listUser;
    feachUser();
  }
}
