import 'package:flutter/material.dart';
import 'package:test_mpp/screens/home/widget/item_card.dart';

class ItemList extends StatelessWidget {
  final List<String> tabs;
  final int selected;
  final Function callBack;
  final PageController pc;
  ItemList(this.tabs, this.selected, this.callBack, this.pc, {Key? key})
      : super(key: key);

  final List<Map<String, dynamic>> itemList = [
    {
      "title": "Fiddle Leaf",
      "room": "Living Room",
      "price": 25,
    },
    {
      "title": "Aloe Vera",
      "room": "Living Room",
      "price": 35,
    },
    {
      "title": "Ficcus",
      "room": "Bathroom",
      "price": 18,
    },
    {
      "title": "Geranimum",
      "room": "Bedroom",
      "price": 12,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pc,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) => callBack(index),
      children: tabs
          .map((e) => ListView.separated(
                itemCount: itemList.length,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, itemIndex) =>
                    ItemCard(selected, itemList[itemIndex]),
              ))
          .toList(),
    );
  }
}
