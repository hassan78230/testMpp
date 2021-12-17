import 'package:flutter/material.dart';

class DetailTab extends StatelessWidget {
  final List<String> tabs;
  final int selected;
  final Function callBack;

  const DetailTab(this.tabs, this.selected, this.callBack, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      // height: 50,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: tabs
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        callBack(key);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selected == key
                                    ? const Color(0xFFffb907)
                                    : Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: selected == key
                                    ? const Color(0xFFffb907)
                                    : Colors.transparent,
                                shape: BoxShape.circle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }
}
