import 'package:flutter/material.dart';

import 'package:keellsapp/Provider/cartProvider.dart';
import 'package:keellsapp/widegets/checkOutSheet.dart';
import 'package:keellsapp/widegets/checkoutButton.dart';
import 'package:keellsapp/widegets/colors.dart';

import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<ItemCart>(context);

    double overallTotal = 0.00;
    for (var index = 0; index < cart.cartItems.length; index++) {
      double itemTotal = cart.cartItems[index].price * cart.itemCount[index];
      overallTotal += itemTotal;
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Cart Page')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                if (cart.cartItems.isEmpty) {
                  return const Center(
                    child: Text('No items in the cart'),
                  );
                } else {
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 0.5, color: Colors.black),
                              bottom:
                                  BorderSide(width: 0.2, color: Colors.black))),
                      width: double.infinity,
                      height: 125,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 60,
                                height: 60,
                                child: Image.asset(
                                  cart.cartItems[index].imageUrl,
                                  fit: BoxFit.cover,
                                )),
                            SizedBox(
                              height: double.infinity,
                              width: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.cartItems[index].title,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      '${cart.cartItems[index].quantity}, Price:'),
                                  const SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (cart.itemCount[index] > 1) {
                                                  cart.itemCount[index]--;
                                                }
                                              });
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Center(
                                        child: Text(
                                          cart.itemCount[index].toString(),
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17),
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cart.itemCount[index]++;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: keellsColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cart.cartItems.removeAt(index);
                                      cart.itemCount.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'Rs.${(cart.cartItems[index].price * cart.itemCount[index]).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          CheckoutButton(
            onSubmit: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CheckoutBottomSheet(
                    total: overallTotal,
                  );
                },
              );
            },
            totalValue: overallTotal.toStringAsFixed(2),
          )
        ],
      ),
    );
  }
}
