import 'package:flutter/material.dart';

class TabSilverDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  final bool space;

  TabSilverDelegate(this.tabBar, {this.space = false});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: tabBar,
      ),
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height + 20;

  @override
  double get minExtent => tabBar.preferredSize.height + 20;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
