import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  final List<String> tabs;
  final int selected;
  final Function callBack;

  const CategoryList(this.tabs, this.selected, this.callBack, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFebeeea),
          borderRadius: BorderRadius.circular(20)),
      // height: 50,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabs
            .asMap()
            .map(
              (key, value) => MapEntry(
                key,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      callBack(key);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: selected == key
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(5),
                      child: Center(
                          child: Text(
                        value,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
