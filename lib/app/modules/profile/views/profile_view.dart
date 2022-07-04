import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentamate_apps/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(children: [
        Container(
          child: Column(
            children: [
              AvatarGlow(
                endRadius: 115,
                glowColor: Colors.black,
                duration: Duration(seconds: 2),
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/logo/noimage.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(
                "Lorem Ipsum",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "lorem.ipsum@gmail.com",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: Container(
            child: Column(
              children: [
                ListTile(
                  onTap: () => {},
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    "Update Status",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    "Change Profile",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    "Change Theme",
                    style: TextStyle(fontSize: 22),
                  ),
                  trailing: Text(
                    "Light",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rent a Mate App",
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                "v.1.0",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
