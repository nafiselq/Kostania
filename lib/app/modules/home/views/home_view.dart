import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentamate_apps/app/data/models/user_model.dart';
import 'package:rentamate_apps/app/model/city.dart';
import 'package:rentamate_apps/app/model/guidance.dart';
import 'package:rentamate_apps/app/model/space.dart';
import 'package:rentamate_apps/app/utils/theme.dart';
import 'package:rentamate_apps/app/widget/bottom_navbar_item.dart';
import 'package:rentamate_apps/app/widget/city_card.dart';
import 'package:rentamate_apps/app/widget/guidance.dart';
import 'package:rentamate_apps/app/widget/space_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITY
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imgUrl: 'assets/img/jakarta.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imgUrl: 'assets/img/bandung.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surayabay',
                      imgUrl: 'assets/img/surabaya.png',
                      isPopular: false,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Recommended Space',
                style: regulerTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: FutureBuilder<List<Space>>(
                future: controller.services.getRecommended(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print("ga ada data");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  print(snapshot.data);
                  List<Space> space = snapshot.data!;
                  print(space);
                  int index = 0;
                  return Column(
                    children: space.map((e) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                          top: index == 1 ? 0 : 30,
                        ),
                        child: SpaceCard(e),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            // Note : TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Tips & Guidance',
                style: regulerTextStyle.copyWith(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  GuidanceCard(
                    Guidance(
                      id: 1,
                      imgUrl: 'assets/img/icon.png',
                      title: 'City Guidelines',
                      updateAt: 'Updated 20 Apr',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GuidanceCard(
                    Guidance(
                      id: 2,
                      imgUrl: 'assets/img/icon2.png',
                      title: 'Jakarta Fairship',
                      updateAt: 'Updated 11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: // NOTE: BOTOM NAVBAR
          Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon/Icon_home_solid.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon/Icon_mail_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon/Icon_card_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon/Icon_love_solid.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
