import 'package:flutter/material.dart';

import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/item_details.dart';
import 'package:keellsapp/widegets/item_card.dart';

// }
class ItemsScreen extends StatelessWidget {
  const ItemsScreen({
    required this.items,
    Key? key,
    this.title,
  }) : super(key: key);

  final List<Item> items;
  final String? title;

  void itemTap(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ItemDetails(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ''),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenSize * 0.02),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 10 / 13,
            crossAxisSpacing: screenSize * 0.02,
            mainAxisSpacing: screenSize * 0.02,
          ),
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            return ItemCard(
              item: items[index],
            );
          },
        ),
      ),
    );
  }
}
