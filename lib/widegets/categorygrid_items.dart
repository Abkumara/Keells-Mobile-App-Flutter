// import 'package:flutter/material.dart';
// import 'package:keells/Model/category.dart';

// class CategoryGridItems extends StatelessWidget {
//   const CategoryGridItems(
//       {super.key, required this.category, required this.onSelect});
//   final Category category;
//   final void Function() onSelect;

//   @override
//   Widget build(BuildContext context) {
//     double screenSizeheight = MediaQuery.of(context).size.height;
//     return InkWell(
//       onTap: onSelect,
//       borderRadius: BorderRadius.circular(16),
//       customBorder: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(color: category.color.withOpacity(1), width: 5)),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           color: category.color,
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(screenSizeheight * 0.018),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(category.image,
//                     width: screenSizeheight * 0.14,
//                     height: screenSizeheight * 0.14),
//                 SizedBox(
//                   height: screenSizeheight * 0.015,
//                 ),
//                 Text(
//                   textAlign: TextAlign.center,
//                   category.title,
//                   style: TextStyle(
//                       fontSize: screenSizeheight * 0.022,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:keellsapp/Model/category.dart';

class CategoryGridItems extends StatelessWidget {
  const CategoryGridItems({
    Key? key,
    required this.category,
    required this.onSelect,
  }) : super(key: key);

  final Category category;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    double screenSizeHeight = MediaQuery.of(context).size.height;
    double screenSizeWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(16),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: category.color.withOpacity(1),
          width: 5,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.color,
        ),
        child: Padding(
          padding: EdgeInsets.all(screenSizeWidth * 0.03),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  category.image,
                  width: screenSizeWidth * 0.2,
                  height: screenSizeWidth * 0.2,
                ),
                SizedBox(
                  height: screenSizeHeight * 0.015,
                ),
                Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenSizeWidth * 0.05,
                    fontWeight: FontWeight.bold,
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
