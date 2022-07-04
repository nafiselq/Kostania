import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/img/404.png'),
        Text('Where are you going ?'),
        Text('Seems like the page that you were \n requested is already gone'),
      ],
    );
  }
}
