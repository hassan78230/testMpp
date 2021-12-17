import 'package:flutter/material.dart';

class DetailBanner extends StatelessWidget {
  final Map<String, dynamic> item;
  const DetailBanner(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(item['room']),
        Text(item['title']),
      ],
    );
  }
}
