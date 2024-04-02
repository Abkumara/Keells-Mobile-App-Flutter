import 'package:flutter/material.dart';

import 'package:keellsapp/Screens/myOrders.dart';
import 'package:keellsapp/widegets/accounttile.dart';
import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/logout_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenSizeheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSizeheight * 0.018,
            vertical: screenSizeheight * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                addRepaintBoundaries: true,
                children: ListTile.divideTiles(context: context, tiles: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenSizeheight * 0.01,
                    ),
                    title: Row(
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(
                            fontSize: screenSizeheight * 0.028,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.mode_edit_outline,
                          size: screenSizeheight * 0.032,
                          color: keellsColor,
                        )
                      ],
                    ),
                    subtitle: const Text(
                      'Username@gmail.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onTap: () {},
                    leading: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/beverages.png',
                        width: screenSizeheight * 0.14,
                        height: screenSizeheight * 0.14,
                      ),
                    ),
                  ),
                  AccountTile(
                      title: 'orders',
                      leadIcon: Icons.shopping_bag_outlined,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const MyOrders();
                          },
                        ));
                      }),
                  AccountTile(
                      title: 'My Details',
                      leadIcon: Icons.badge_outlined,
                      onPressed: () {}),
                  AccountTile(
                      title: 'Delivery Address',
                      leadIcon: Icons.location_on_outlined,
                      onPressed: () {}),
                  AccountTile(
                      title: 'Payment Methods',
                      leadIcon: Icons.payment_sharp,
                      onPressed: () {}),
                  AccountTile(
                      title: 'Promo Card',
                      leadIcon: Icons.confirmation_number_outlined,
                      onPressed: () {}),
                  AccountTile(
                      title: 'Notifications',
                      leadIcon: Icons.notifications_none_outlined,
                      onPressed: () {}),
                  AccountTile(
                      title: 'Help',
                      leadIcon: Icons.help_outline_outlined,
                      onPressed: () {}),
                  AccountTile(
                      title: 'About',
                      leadIcon: Icons.report_gmailerrorred,
                      onPressed: () {}),
                  const ListTile(),
                ]).toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: LogoutButton(buttonName: 'Logout', onSubmit: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
