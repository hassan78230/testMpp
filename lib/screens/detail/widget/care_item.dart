import 'package:flutter/material.dart';

class CareItem extends StatelessWidget {
  final String imgUrl;
  final String care;
  final String daysBefore;
  const CareItem(this.imgUrl, this.care, this.daysBefore, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: const Color(0xFF264f43),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                color: Color(
                  0xFF6c9772,
                ),
                shape: BoxShape.circle),
            child: Center(
              child: ImageIcon(
                AssetImage(
                  imgUrl,
                ),
                size: 25.0,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            care,
            style: const TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            'in $daysBefore days',
            style: const TextStyle(
                color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
