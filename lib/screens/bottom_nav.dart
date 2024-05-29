import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myshop/screens/watches_page.dart';
import 'package:myshop/screens/iphone_page.dart';

import 'macbook_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  bool isSelectedWatches = true;
  bool isSelectedIphones = false;
  bool isSelectedMacBooks = false;

  List<Widget> myPages = [
    const WatchesPage(),
    const IphonePage(),
    const MacBookPage()
  ];

  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width * 25 / 100,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedWatches = true;
                        isSelectedIphones = false;
                        isSelectedMacBooks = false;
                        selectedIndex = 0;
                      });
                    },
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: Column(
                        children: [
                          Text(
                            "watches",
                            style: TextStyle(
                                color: isSelectedWatches
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            height: 2,
                            width: 50,
                            color:
                                isSelectedWatches ? Colors.white : Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedWatches = false;
                        isSelectedIphones = true;
                        isSelectedMacBooks = false;
                        selectedIndex = 1;
                      });
                    },
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: Column(
                        children: [
                          Text(
                            "iphones",
                            style: TextStyle(
                                color: isSelectedIphones
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            height: 2,
                            width: 50,
                            color:
                                isSelectedIphones ? Colors.white : Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedWatches = false;
                        isSelectedIphones = false;
                        isSelectedMacBooks = true;
                        selectedIndex = 2;
                      });
                    },
                    child: Transform.rotate(
                      angle: -pi / 2,
                      child: Column(
                        children: [
                          Text(
                            "mac books",
                            style: TextStyle(
                                color: isSelectedMacBooks
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 250),
                            height: 2,
                            width: 50,
                            color:
                                isSelectedMacBooks ? Colors.white : Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(child: myPages[selectedIndex], height: MediaQuery.sizeOf(context).height,width: MediaQuery.sizeOf(context).width*75/100,)
        ],
      ),
    );
  }
}
