import 'package:flutter/material.dart';

import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Provider/cartProvider.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/keells_button.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int count = 1;
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      widget.item.imageUrl,
                      width: double.infinity,
                      height: 300,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isFavourite = !isFavourite;
                                isFavourite
                                    ? ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content: Text('Add to Favorite'),
                                        duration: Duration(seconds: 3),
                                      ))
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content: Text('Remove from Favorite'),
                                        duration: Duration(seconds: 3),
                                      ));
                              });
                            },
                            icon: Icon(
                              isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: keellsColor,
                            ))
                      ],
                    ),
                    Text(
                      widget.item.quantity,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (count > 1) {
                                    count--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            const SizedBox(width: 10),
                            Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(child: Text(count.toString()))),
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  count++;
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: keellsColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${widget.item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: keellsColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Product Details:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.item.details,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    const Text('nutrition'),
                    const Divider(),
                    const Text('Remark'),
                    const Divider(),
                  ],
                ),
              ),
            ),
            KeellsButton(
              buttonName: 'Add to Cart',
              buttonColor: keellsColor,
              onSubmit: () {
                if (count > 0) {
                  Provider.of<ItemCart>(
                    context,
                    listen: false,
                  ).addToCart(widget.item, count);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Add to Cart'),
                    duration: Duration(seconds: 3),
                  ));
                }
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
