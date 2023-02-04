import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:user_gorest/app/data/user_models.dart';
import 'package:user_gorest/app/routes/app_pages.dart';

import '../../../../components/seach_texts.dart';
import '../../../../components/text_view.dart';
import '../../../../styles/app_color.dart';
import '../../../../styles/app_typo.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future<void> refresh() {
      return Future<void>.delayed(Duration(seconds: 1), () async {
        await controller.feachUser();
      });
    }

    ;
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () => Get.toNamed(Routes.ADD_USER),
            child: Icon(IconlyLight.plus)),
        appBar: AppBar(
          title: Text(
            'Daftar Pengguna',
            style: AppTypo.highlight1,
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: RefreshIndicator(
            onRefresh: refresh,
            color: AppColor.primaryColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GetBuilder<HomeController>(builder: (context) {
                    return SearchBar(
                      hintText: 'Cari user...',
                      onChange: (value) {
                        controller.searchUser(value);
                      },
                    );
                  }),
                  SizedBox(height: 12),
                  SizedBox(
                      child: Column(
                    children: [
                      GetBuilder<HomeController>(builder: (context) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.cariUsers.length,
                            itemBuilder: (context, index) {
                              Users user = controller.cariUsers[index];
                              return Padding(
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: GestureDetector(
                                    onTap: () => Get.toNamed(Routes.EDIT_USER,
                                        arguments: {
                                          "id": user.id,
                                          "name": user.name,
                                          "email": user.email,
                                          "gender": user.gender,
                                          "status": user.status
                                        }),
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              color: AppColor.disableColor,
                                              width: 1.2)),
                                      child: Column(
                                        children: [
                                          TextView(
                                              keys: 'ID', value: '${user.id}'),
                                          SizedBox(height: 8),
                                          TextView(
                                              keys: 'NAMA',
                                              value: '${user.name}'),
                                          SizedBox(height: 8),
                                          TextView(
                                              keys: 'EMAIL',
                                              value: '${user.email}'),
                                          SizedBox(height: 8),
                                          TextView(
                                              keys: 'GENDER',
                                              value: '${user.gender}'),
                                          SizedBox(height: 8),
                                          TextView(
                                              keys: 'STATUS',
                                              value: '${user.status}'),
                                        ],
                                      ),
                                    ),
                                  ));
                            });
                      }),
                      SizedBox(height: 56)
                    ],
                  ))
                ],
              ),
            ),
          ),
        )));
  }
}
