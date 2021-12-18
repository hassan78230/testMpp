import 'package:flutter/material.dart';
import 'package:test_mpp/constants/colors.dart';
import 'package:test_mpp/models/item.dart';
import 'package:test_mpp/screens/detail/widget/care_item.dart';
import 'package:test_mpp/screens/detail/widget/detail_content.dart';
import 'package:test_mpp/screens/detail/widget/detail_tab.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  const DetailPage(this.item, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final tabs = ['About', 'Tips', 'Activity'];
  var selected = 0;
  final pc = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildAppBar(),
            _buildHeader(),
            _buidContents(),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.room!,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.item.title!,
                    style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontFamily: 'Philosopher',
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color(0xFF264f43),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(Icons.add_photo_alternate, color: Colors.white),
                          Text(
                            'Add Photo',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: const <Widget>[
                      CareItem('assets/icons/watering_can.png', "Water", "6"),
                      SizedBox(
                        width: 10.0,
                      ),
                      CareItem('assets/icons/plant.png', "Fertilizing", "28"),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: DetailTab(
                tabs,
                selected,
                (int index) {
                  setState(() {
                    selected = index;
                  });
                  pc.jumpToPage(index);
                },
              ),
            ),
          ],
        ),
        Positioned(
          right: -100,
          bottom: 0,
          child: SizedBox(
            height: 400,
            width: 300,
            child: Image.asset(
              "assets/images/plant.png",
              alignment: Alignment.bottomRight,
            ),
          ),
        ),
      ],
    );
  }

  _buidContents() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: PageView(
          controller: pc,
          onPageChanged: (value) {
            setState(() {
              selected = value;
            });
            pc.jumpToPage(value);
          },
          children: [
            DetailContent(widget.item.about!),
            DetailContent(widget.item.tips!),
            DetailContent(widget.item.activity!),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return IconButton(
      padding: const EdgeInsets.all(0),
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    );
  }

  _buildButton() {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ElevatedButton(
          child: const Text('Change Schedule'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFFffb900),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            // onPrimary: Colors.white,
            // onSurface: Colors.grey,
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
