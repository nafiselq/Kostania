import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  const RatingItem({Key? key, this.index = 0, this.rating = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating
          ? 'assets/icon/Icon_star_solid.png'
          : 'assets/icon/Icon_star_grey.png',
      width: 20,
    );
  }
}
