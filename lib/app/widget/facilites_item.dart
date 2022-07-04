import 'package:flutter/material.dart';
import 'package:rentamate_apps/app/utils/theme.dart';

class FacilityItem extends StatelessWidget {
  final String? name;
  final String? imageUrl;
  final int? total;

  FacilityItem({this.name, this.imageUrl, this.total});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl!,
          width: 32,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text.rich(TextSpan(text: '$total ', style: purpleTextStyle, children: [
          TextSpan(
            text: name,
            style: greyTextStyle,
          ),
        ]))
      ],
    );
  }
}
