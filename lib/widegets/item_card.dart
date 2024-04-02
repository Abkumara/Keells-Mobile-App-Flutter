import 'package:flutter/material.dart';

import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/item_details.dart';
import 'package:keellsapp/widegets/colors.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    //required this.onTap,
  });
  final Item item;
  //final void Function(Item item) onTap;

  @override
  Widget build(BuildContext context) {
    double screenSizeheight = MediaQuery.of(context).size.height;
    double screenSizewidth = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(screenSizeheight * 0.018),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (ctx) {
            return ItemDetails(
              item: item,
            );
          },
        ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenSizeheight * 0.008,
          horizontal: screenSizewidth * 0.0085,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenSizeheight * 0.018),
          shape: BoxShape.rectangle,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              item.imageUrl,
              width: screenSizewidth * 0.23,
              height: screenSizeheight * 0.13,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: screenSizeheight * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenSizeheight * 0.002,
                ),
                Row(
                  children: [
                    Text(item.quantity),
                    SizedBox(
                      width: screenSizeheight * 0.01,
                    ),
                    const Text('price'),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('\$${item.price}'),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: keellsColor,
                      size: screenSizeheight * 0.045,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
