import 'package:flutter/material.dart';
import 'package:test_mpp/constants/colors.dart';
import 'package:test_mpp/core/extensions.dart';

class DetailContent extends StatelessWidget {
  final String tabContent;
  const DetailContent(this.tabContent, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      children: <Widget>[
        const Text(
          'Care',
          style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontSize: 35),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Divider(),
        ),
        Text(
          tabContent.capitalize(),
          style: const TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
              fontSize: 25),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
