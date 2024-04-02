import 'dart:async';

import 'package:flutter/material.dart';

import 'package:keellsapp/Data/dummydata.dart';
import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/searchScreen.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/item_card.dart';
import 'package:keellsapp/widegets/searchbar.dart';

//import 'package:keells/widegets/item_card.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key, this.userName = 'Dasun Silva'});
  final String userName;

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  int currentIndex = 0;
  late Timer timer;
  List<Item> availableItems = dummyItems;

  final List<String> images = [
    'assets/banana.jpg',
    'assets/beef.jpg',
    'assets/buns.jpg',
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Item> exclusiveOfferItems =
        availableItems.where((item) => item.isExclusiveOffer).toList();
    List<Item> bestSellerItems =
        availableItems.where((item) => item.isBestSelling).toList();
    List<Item> groceryItems =
        availableItems.where((item) => item.isGroceries).toList();
    double screenSizeheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: screenSizeheight * 0.012,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/Keellslogosmall.png',
                    ),
                    Icon(
                      Icons.notifications,
                      color: keellsColor,
                    ),
                  ],
                ),
                Text(
                  'Hello, Guest !',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: const Color.fromARGB(75, 102, 102, 99),
                    fontSize: screenSizeheight * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenSizeheight * 0.012,
                ),
                SearchBarItem(
                  searchTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchBarScreen(),
                      )),
                ),
                SizedBox(
                  height: screenSizeheight * 0.023,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  height: screenSizeheight * 0.149,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      images[currentIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSizeheight * 0.021,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exclusive Offer',
                      style: TextStyle(fontSize: screenSizeheight * 0.025),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(fontSize: screenSizeheight * 0.022),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSizeheight * 0.021,
                ),
                SizedBox(
                  height: screenSizeheight * 0.26,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: exclusiveOfferItems
                            .map(
                              (item) => SizedBox(
                                width: screenSizeheight * 0.21,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ItemCard(item: item),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best Selling',
                      style: TextStyle(fontSize: screenSizeheight * 0.025),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(fontSize: screenSizeheight * 0.022),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSizeheight * 0.021,
                ),
                SizedBox(
                  height: screenSizeheight * 0.26,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: bestSellerItems
                            .map(
                              (item) => SizedBox(
                                width: screenSizeheight * 0.21,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ItemCard(item: item),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ),
                SizedBox(
                  height: screenSizeheight * 0.021,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Groceries',
                      style: TextStyle(fontSize: screenSizeheight * 0.025),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See all',
                        style: TextStyle(fontSize: screenSizeheight * 0.022),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenSizeheight * 0.021,
                ),
                SizedBox(
                  height: screenSizeheight * 0.26,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: groceryItems
                            .map(
                              (item) => SizedBox(
                                width: screenSizeheight * 0.21,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ItemCard(item: item),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
