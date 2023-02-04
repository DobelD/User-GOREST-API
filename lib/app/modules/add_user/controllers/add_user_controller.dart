import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/user_models.dart';

class AddUserController extends GetxController {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController genderC = TextEditingController();
  TextEditingController statusC = TextEditingController();
  List<Users> listUser = [];
  List<Users> users = [];
  var dio = Dio();
  void addUser() async {
    String token =
        "6aeed75a9fc239b8af14b54ed30990aca60209e864354005ada1ea8387398d02";
    var dio = Dio();
    var response = await dio.post('https://gorest.co.in/public/v2/users',
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "id": "${212514 + Random().nextInt(6)}",
          "name": nameC.text,
          "email": emailC.text,
          "gender": genderC.text,
          "status": statusC.text
        });
    if (response.statusCode == 201) {
      print("Berhasil");
      nameC.clear();
      emailC.clear();
      genderC.clear();
      statusC.clear();
    }
    print(response.statusCode);
  }

  void pro() {
    print('Coba');
  }

  @override
  void onInit() {
    super.onInit();
  }
}
