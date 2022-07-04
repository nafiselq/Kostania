import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentamate_apps/app/model/space.dart';
import 'package:rentamate_apps/app/model/space_model.dart';
import 'package:rentamate_apps/app/modules/detail_page/views/detail_page_view.dart';
import 'package:rentamate_apps/app/utils/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  SpaceCard(this.space);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(DetailPageView(), arguments: space),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    space.imageUrl.toString(),
                    width: 130,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon/Icon_star_solid.png',
                            height: 22,
                            width: 22,
                          ),
                          Text(
                            '${space.rating}/5',
                            style: whiteTextStyle.copyWith(
                              fontSize: 13.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('${space.city}, ${space.country}', style: greyTextStyle)
            ],
          )
        ],
      ),
    );
  }
}
