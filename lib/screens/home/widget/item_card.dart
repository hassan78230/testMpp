import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int index;
  final Map<String, dynamic> item;
  const ItemCard(this.index, this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rad = 30.0;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(top: 40, left: 40),
        height: 500,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/plant.png'),
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF112823),
              Color(0xFF0b3b2d),
            ],
          ),
          borderRadius: BorderRadius.circular(rad),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item['title'],
                  style: const TextStyle(
                      fontFamily: 'Philosopher',
                      color: Colors.white,
                      fontSize: 48),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  item['room'],
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      color: const Color(0xFF6c9772),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(rad),
                          topLeft: Radius.circular(rad))),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '\$${item['price'].toString()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'from',
                        style: TextStyle(
                            fontSize: 18,
                            color: index == 1
                                ? Colors.red
                                : const Color(0xFFaccbb1)),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
