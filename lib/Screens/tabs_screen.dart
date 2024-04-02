import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:keellsapp/Data/dummydata.dart';
import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/account.dart';
import 'package:keellsapp/Screens/cart.dart';
import 'package:keellsapp/Screens/explore.dart';
import 'package:keellsapp/Screens/shop.dart';
import 'package:keellsapp/Screens/utilityScreen.dart';
import 'package:keellsapp/widegets/colors.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Item> availableItems = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availableItems = dummyItems.where((item) => true).toList();
    Widget activePage = const ShopScreen();
    if (_selectedPageIndex == 1) {
      activePage = ExploreScreen(
        availableItem: availableItems,
      );
    } else if (_selectedPageIndex == 2) {
      activePage = const CartScreen();
    } else if (_selectedPageIndex == 3) {
      activePage = const UtilityScreen();
      // final favoriteItems = ref.watch(favoriteItemProvider);
      // activePage = ItemsScreen(
      //   items: favoriteItems,
      //   title: 'Favorite',
      // );
    } else if (_selectedPageIndex == 4) {
      activePage = const AccountScreen();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_mall_directory_outlined,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.manage_search_rounded,
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(
                IconData(0x0021,
                    fontFamily:
                        'MaterialIcons'), // 0x0021 is the Unicode for exclamation mark
              ),
              label: 'Utility'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'Account')
        ],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: keellsColor,
        unselectedItemColor: Colors.black,
        onTap: _selectPage,
      ),
    );
  }
}
