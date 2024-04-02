import 'package:flutter/material.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key, required this.searchTap});
  final void Function() searchTap;
  @override
  Widget build(BuildContext context) {
    double screenSizeheight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: searchTap,
      child: Container(
        width: double.infinity,
        height: screenSizeheight * 0.067,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            25,
          ),
          color: const Color.fromARGB(205, 242, 243, 242),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Search Store',
              style: TextStyle(
                  color: Colors.grey, fontSize: screenSizeheight * 0.023),
            ),
          ],
        ),
      ),
    );
  }
}
