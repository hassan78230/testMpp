import 'package:flutter/material.dart';
import 'package:test_mpp/screens/home/widget/category_list.dart';
import 'package:test_mpp/screens/home/widget/item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = ['Top', 'Outdoor', 'Indoor'];
  var selected = 0;
  final pc = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            children: <Widget>[
              _buildHeader(),
              const SizedBox(
                height: 15.0,
              ),
              CategoryList(tabs, selected, (int index) {
                setState(() {
                  selected = index;
                });
                pc.jumpToPage(index);
              }),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                  child: ItemList(tabs, selected, (int index) {
                setState(() {
                  selected = index;
                });
              }, pc))
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Monday,Dec 28',
              style: TextStyle(color: Colors.grey[400]!, fontSize: 18),
            ),
            const Text(
              'Top Picks',
              style: TextStyle(
                  fontFamily: 'Philosopher',
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Color(0xFF0e362b)),
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(
            Icons.apps,
            size: 40,
            color: Color(0xFF0e362b),
          ),
        )
      ],
    );
  }
}
