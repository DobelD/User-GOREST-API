import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_gorest/components/custom_btn.dart';
import 'package:user_gorest/components/form_texts.dart';
import 'package:user_gorest/styles/app_color.dart';
import 'package:user_gorest/styles/app_typo.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tambah Pengguna', style: AppTypo.highlight1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
              child: Column(
            children: [
              FormText(
                hint: 'NAMA',
                controller: controller.nameC,
              ),
              SizedBox(height: 12),
              FormText(
                hint: 'EMAIL',
                controller: controller.emailC,
              ),
              SizedBox(height: 12),
              FormText(
                hint: 'GENDER',
                controller: controller.genderC,
              ),
              SizedBox(height: 12),
              FormText(
                hint: 'STATUS',
                controller: controller.statusC,
              ),
              SizedBox(height: 12),
            ],
          )),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        height: Get.height * 0.1,
        width: Get.width,
        child: CustomBtn(
          text: 'BUAT PENGGUNA',
          color: AppColor.primaryColor,
          onPressed: () => controller.addUser(),
        ),
      ),
    );
  }
}
