import 'package:flutter/material.dart';
import 'package:test_mpp/models/item.dart';
import 'package:test_mpp/screens/home/widget/item_card.dart';

class ItemList extends StatelessWidget {
  final List<String> tabs;
  final int selected;
  final Function callBack;
  final PageController pc;
  const ItemList(this.tabs, this.selected, this.callBack, this.pc, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsTotal = Item.generatedItems();
    List<Item> items = [];
    switch (selected) {
      case 0:
        items = itemsTotal.where((element) => element.top == true).toList();
        break;
      case 1:
        items = itemsTotal
            .where((element) => element.category == "indoor")
            .toList();
        break;
      case 2:
        items = itemsTotal
            .where((element) => element.category == "outdoor")
            .toList();
        break;
      default:
    }

    return PageView(
      controller: pc,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (index) => callBack(index),
      children: tabs
          .map((e) => ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, index) => const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, itemIndex) =>
                    ItemCard(selected, items[itemIndex]),
              ))
          .toList(),
    );
  }
}
