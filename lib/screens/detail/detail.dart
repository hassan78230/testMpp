import 'package:flutter/material.dart';
import 'package:test_mpp/constants/colors.dart';
import 'package:test_mpp/models/item.dart';
import 'package:test_mpp/screens/detail/widget/care_item.dart';
import 'package:test_mpp/screens/detail/widget/detail_content.dart';
import 'package:test_mpp/screens/detail/widget/tab_silver_delegate.dart';

class DetailPage extends StatefulWidget {
  final Item item;
  const DetailPage(this.item, {Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final tabs = ['About', 'Tips', 'Activity'];
  var selected = 0;
  final pc = PageController();
  late ScrollController _scrollController;
  var top = 0.0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    tabController.addListener(() {
      setState(() {
        selected = tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            DefaultTabController(
              length: 3,
              child: NestedScrollView(
                // floatHeaderSlivers: true,
                controller: _scrollController,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: kPrimaryColor,
                      expandedHeight: 350,
                      flexibleSpace: LayoutBuilder(builder: (context, cons) {
                        top = cons.biggest.height;
                        return FlexibleSpaceBar(
                          background: Stack(
                            children: [
                              _buildHeader(),
                              _buildAppBar(),
                            ],
                          ),
                        );
                      }),
                    ),
                    SliverPersistentHeader(
                      delegate: TabSilverDelegate(
                        _buildTabBar(),
                      ),
                      pinned: true,
                    )
                  ];
                },
                body: _buildTabBarViewList(),
              ),
            ),
            _buildFloatImage(),
            _buildButton(),
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

  Widget _buildHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
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
                  // fontWeight: FontWeight.w200,
                ),
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
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
        controller: tabController,
        // indicatorWeight: 0,
        // indicatorSize: TabBarIndicatorSize.label,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[400],
        indicatorColor: Colors.transparent,
        isScrollable: true,
        labelPadding: const EdgeInsets.only(
          left: 5,
          right: 40,
        ),
        tabs: List.generate(
          tabs.length,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tabs[index],
                style: const TextStyle(fontSize: 15),
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color:
                        selected == index ? Colors.orange : Colors.transparent,
                    shape: BoxShape.circle),
              )
            ],
          ),
        ));
  }

  Container _buildTabBarViewList() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TabBarView(
        controller: tabController,
        children: [
          DetailContent(widget.item.about!),
          DetailContent(widget.item.tips!),
          DetailContent(widget.item.activity!),
        ],
      ),
    );
  }

  Widget _buildFloatImage() {
    const double defaultMargin = 350;
    const double defaultStart = 320;
    const double defaultEnd = defaultStart / 1.6;

    double top = defaultMargin;
    double scale = 1.0;

    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      // print(offset);
      top -= offset;
      if (offset < defaultMargin - defaultStart) {
        scale = 1.0;
      } else if (offset < defaultStart - defaultEnd) {
        scale = (defaultMargin - defaultEnd - offset) / defaultEnd;
      } else {
        scale = 0;
      }
    }
    return Positioned(
        top: top - 100,
        right: -70,
        child: Transform(
          alignment: Alignment.bottomCenter,
          transform: Matrix4.identity()..scale(scale),
          child: SizedBox(
            height: 200,
            child: Image.asset(
              "assets/images/plant.png",
            ),
          ),
        ));
  }

  _buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: double.maxFinite,
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
      ),
    );
  }
}
