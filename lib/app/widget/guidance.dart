import 'package:flutter/material.dart';
import 'package:rentamate_apps/app/model/guidance.dart';
import 'package:rentamate_apps/app/utils/theme.dart';

class GuidanceCard extends StatelessWidget {
  final Guidance guidance;
  GuidanceCard(this.guidance);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          guidance.imgUrl!,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guidance.title!,
              style: blackTextStyle.copyWith(
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              guidance.updateAt!,
              style: greyTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_rounded,
            size: 24.0,
          ),
          color: greyColor,
        ),
      ],
    );
  }
}
