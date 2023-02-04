import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/custom_btn.dart';
import '../../../../components/form_texts.dart';
import '../../../../styles/app_color.dart';
import '../../../../styles/app_typo.dart';
import '../controllers/edit_user_controller.dart';

class EditUserView extends GetView<EditUserController> {
  const EditUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Pengguna', style: AppTypo.highlight1),
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
          height: Get.height * 0.17,
          width: Get.width,
          child: Column(
            children: [
              CustomBtn(
                text: 'SIMPAN',
                color: AppColor.primaryColor,
                onPressed: () async {
                  controller.editUser();
                  Get.back();
                },
              ),
              SizedBox(height: 12),
              CustomBtn(
                text: 'HAPUS PENGGUNA',
                color: AppColor.secondaryColor,
                onPressed: () async {
                  controller.deleteUser();
                  Get.back();
                },
              ),
            ],
          )),
    );
  }
}
