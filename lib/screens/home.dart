import 'package:flutter/material.dart';
import 'package:kirtasite/Custom/color.dart';
import 'package:kirtasite/Custom/size.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kirtasite/components/bottomNavBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  List<Widget> _pages = [
    Text(" das" * 100),
    Center(),
    Text("18 Sep" * 1000),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _customBottomBar(),
      body: SingleChildScrollView(
        child: _pages[pageIndex],
      ),
    );
  }

  void _changePage(int index) {
    pageIndex = index;
    setState(() {});
  }

  Widget _customBottomBar() {
    return BottomNavBar(
      body: Container(
        padding: CustomSize().bottomBarIn,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(color: CustomColors().saydam),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () { _changePage(0);},
              icon:  Icon(
                Iconsax.home4,
                color: pageIndex == 0 ? CustomColors().baseColor : CustomColors().baseBlack, 
              ),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {_changePage(1);},
              icon: Icon(
                Iconsax.box4,
                color: pageIndex == 1 ? CustomColors().baseColor : CustomColors().baseBlack,
              ),
            ),
            IconButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {_changePage(2);},
              icon: Icon(
                Iconsax.setting4,
                color: pageIndex == 2 ? CustomColors().baseColor : CustomColors().baseBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
