import 'package:flutter/material.dart';

import 'package:keellsapp/Data/dummydata.dart';
import 'package:keellsapp/Model/category.dart';
import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/items.dart';
import 'package:keellsapp/Screens/searchScreen.dart';
import 'package:keellsapp/widegets/categorygrid_items.dart';
import 'package:keellsapp/widegets/searchbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key, required this.availableItem});

  final List<Item> availableItem;

  void _onSelect(BuildContext context, Category category) {
    final filteredItems = availableItem
        .where((item) => item.category.contains(category.id))
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ItemsScreen(
          items: filteredItems,
          title: category.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Find Products',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: screenSizeHeight * 0.028),
          ),
        ),
      ),
      body: Column(
        children: [
          SearchBarItem(
            searchTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchBarScreen(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(screenSizeWidth * 0.05),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenSizeWidth > 600 ? 3 : 2,
                childAspectRatio: 12 / 13,
                crossAxisSpacing: screenSizeHeight * 0.018,
                mainAxisSpacing: 20,
              ),
              itemCount: availableCategories.length,
              itemBuilder: (ctx, index) {
                final category = availableCategories[index];
                return CategoryGridItems(
                  category: category,
                  onSelect: () => _onSelect(context, category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
