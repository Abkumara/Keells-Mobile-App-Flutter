import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/utilityBlock.dart';

class UtilityScreen extends StatelessWidget {
  const UtilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
            child: Text(
          'Utility Payment',
        )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UtilityBlock(
                    utilityName: 'Water',
                    imageName: 'assets/water.png',
                    colorName:
                        const Color.fromRGBO(83, 177, 117, 26).withOpacity(0.1),
                    borderColor:
                        const Color.fromRGBO(83, 177, 117, 26).withOpacity(0.7),
                  ),
                  UtilityBlock(
                    utilityName: 'Telecom',
                    imageName: 'assets/phone.png',
                    colorName: const Color.fromRGBO(248, 164, 76, 26 / 255)
                        .withOpacity(0.1),
                    borderColor: const Color.fromRGBO(248, 164, 76, 26 / 255)
                        .withOpacity(0.7),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UtilityBlock(
                    utilityName: 'Insurance',
                    imageName: 'assets/insurance.png',
                    colorName: const Color.fromRGBO(247, 165, 93, 64 / 255)
                        .withOpacity(0.25),
                    borderColor: const Color.fromRGBO(247, 165, 93, 64 / 255),
                  ),
                  UtilityBlock(
                    utilityName: 'Electricity',
                    imageName: 'assets/elec.png',
                    colorName: const Color.fromRGBO(255, 224, 60, 64 / 255)
                        .withOpacity(0.25),
                    borderColor: const Color.fromRGBO(255, 248, 184, 0.5),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
