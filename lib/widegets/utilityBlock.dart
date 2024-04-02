import 'package:flutter/material.dart';

class UtilityBlock extends StatelessWidget {
  const UtilityBlock({
    super.key,
    required this.utilityName,
    required this.imageName,
    required this.colorName,
    required this.borderColor,
  });
  final String utilityName;
  final String imageName;
  final Color colorName;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    double screenSizeWidth = MediaQuery.of(context).size.width;
    double screenSizeHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: screenSizeWidth * 0.43,
          height: screenSizeHeight * 0.25,
          decoration: BoxDecoration(
              color: colorName,
              border: Border.all(
                color: borderColor,
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(imageName),
              SizedBox(
                height: screenSizeHeight * 0.03,
              ),
              Text(
                utilityName,
                style: TextStyle(
                  fontSize: screenSizeWidth * 0.054,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
