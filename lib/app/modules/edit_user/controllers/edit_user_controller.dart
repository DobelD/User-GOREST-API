import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/user_models.dart';

class EditUserController extends GetxController {
  TextEditingController nameC =
      TextEditingController(text: Get.arguments['name'].toString());
  TextEditingController emailC =
      TextEditingController(text: Get.arguments['email'].toString());
  TextEditingController genderC =
      TextEditingController(text: Get.arguments['gender'].toString());
  TextEditingController statusC =
      TextEditingController(text: Get.arguments['status'].toString());
  List<Users> listUser = [];
  List<Users> users = [];
  var dio = Dio();
  void editUser() async {
    String token =
        "6aeed75a9fc239b8af14b54ed30990aca60209e864354005ada1ea8387398d02";
    var dio = Dio();
    var response = await dio.put(
        'https://gorest.co.in/public/v2/users/${Get.arguments['id']}',
        options: Options(headers: {"Authorization": "Bearer $token"}),
        data: {
          "id": Get.arguments['id'],
          "name": nameC.text,
          "email": emailC.text,
          "gender": genderC.text,
          "status": statusC.text
        });
    if (response.statusCode == 201) {
      print("Berhasil");
    }
  }

  void deleteUser() async {
    String token =
        "6aeed75a9fc239b8af14b54ed30990aca60209e864354005ada1ea8387398d02";
    var dio = Dio();
    var response = await dio.delete(
      'https://gorest.co.in/public/v2/users/${Get.arguments['id']}',
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    if (response.statusCode == 204) {
      print("Berhasil");
    }
    print(response.statusCode);
  }
}
