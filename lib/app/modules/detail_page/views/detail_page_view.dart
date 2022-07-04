import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentamate_apps/app/model/space.dart';
import 'package:rentamate_apps/app/utils/theme.dart';
import 'package:rentamate_apps/app/widget/facilites_item.dart';
import 'package:rentamate_apps/app/widget/rating_item.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailPageController());
    final Space space = Get.arguments;
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Image.network(
                space.imageUrl.toString(),
                width: MediaQuery.of(context).size.width,
                height: 350,
                fit: BoxFit.cover,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 328.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        color: whiteColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        // NOTE: HEADER
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    space.name.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 22.0,
                                    ),
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
                                  )
                                ],
                              ),
                              Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      left: 2,
                                    ),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating!,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // NOTE : MAIN FACILITES
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            'Main Facilities',
                            style: regulerTextStyle.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FacilityItem(
                                name: 'kitchen',
                                imageUrl: 'assets/icon/kitchen.png',
                                total: space.numberOfKitchens,
                              ),
                              FacilityItem(
                                name: 'bedroom',
                                imageUrl: 'assets/icon/bedroom.png',
                                total: space.numberOfBedrooms,
                              ),
                              FacilityItem(
                                name: 'Big Lemari',
                                imageUrl: 'assets/icon/cupboard.png',
                                total: space.numberOfCupboards,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // NOTE: PHOTO
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            'Photos',
                            style: regulerTextStyle.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          height: 88,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: space.photos!.map((e) {
                                return Container(
                                  margin: EdgeInsets.only(left: edge),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      e,
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList()

                              // [
                              //   SizedBox(
                              //     width: edge,
                              //   ),
                              //   Image.asset(
                              //     'assets/img/photo.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18.0,
                              //   ),
                              //   Image.asset(
                              //     'assets/img/photo2.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: 18.0,
                              //   ),
                              //   Image.asset(
                              //     'assets/img/photo3.png',
                              //     width: 110,
                              //     height: 88,
                              //     fit: BoxFit.cover,
                              //   ),
                              //   SizedBox(
                              //     width: edge,
                              //   ),
                              // ],
                              ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // NOTE : LOCATION
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Text(
                            'Location',
                            style: regulerTextStyle.copyWith(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${space.address}\n${space.city}',
                                style: greyTextStyle,
                              ),
                              InkWell(
                                onTap: () =>
                                    controller.launchInWebViewWithoutJavaScript(
                                        Uri.parse('${space.mapUrl}')),
                                child: Image.asset(
                                  'assets/icon/btn_maps.png',
                                  width: 40,
                                  height: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: edge),
                          child: Container(
                            height: 50.0,
                            width:
                                MediaQuery.of(context).size.width - (2 * edge),
                            child: ElevatedButton(
                                onPressed: () =>
                                    controller.makePhoneCall('${space.phone}'),
                                child: Text(
                                  'Book Now',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 18.0,
                                  ),
                                ),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            purpleColor),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(17.0),
                                    )))),
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        'assets/icon/btn_back.png',
                        width: 40,
                      ),
                    ),
                    Image.asset('assets/icon/btn_wishlist.png', width: 40),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
