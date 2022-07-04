import 'package:flutter/material.dart';
import 'package:rentamate_apps/app/model/city.dart';
import 'package:rentamate_apps/app/utils/theme.dart';

class CityCard extends StatelessWidget {
  final City city;
  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        18.0,
      ),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imgUrl!,
                  width: 120,
                  height: 102,
                ),
                city.isPopular == true
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.0),
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icon/Icon_star_solid.png',
                              height: 22,
                              width: 22,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              city.name!,
              style: blackTextStyle.copyWith(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
