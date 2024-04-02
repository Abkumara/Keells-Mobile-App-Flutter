import 'package:flutter/material.dart';

import 'package:keellsapp/widegets/colors.dart';
import 'package:keellsapp/widegets/filterCheckBox.dart';
import 'package:keellsapp/widegets/keells_button.dart';

class FilterScreen extends StatefulWidget {
  final Map<String, bool> initialFilters;

  const FilterScreen({Key? key, required this.initialFilters})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late Map<String, bool> _filters;

  @override
  void initState() {
    super.initState();
    _filters = widget.initialFilters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Filter',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, null);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CheckBoxSet(
                  filterBool: _filters['isEggs']!,
                  filterName: "Eggs",
                  onChange: (value) {
                    setState(() {
                      _filters['isEggs'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isNoodles']!,
                  filterName: "Noodles & Pasta",
                  onChange: (value) {
                    setState(() {
                      _filters['isNoodles'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isChips']!,
                  filterName: "Chips & Crisps",
                  onChange: (value) {
                    setState(() {
                      _filters['isChips'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isFast']!,
                  filterName: "Fast Food",
                  onChange: (value) {
                    setState(() {
                      _filters['isFast'] = value;
                    });
                  },
                ),
                const Text(
                  'Brand',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CheckBoxSet(
                  filterBool: _filters['isIndividuval']!,
                  filterName: "individuval Collection",
                  onChange: (value) {
                    setState(() {
                      _filters['isIndividuval'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isCola']!,
                  filterName: "Cocacola",
                  onChange: (value) {
                    setState(() {
                      _filters['isCola'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isIfad']!,
                  filterName: "Ifad",
                  onChange: (value) {
                    setState(() {
                      _filters['isIfad'] = value;
                    });
                  },
                ),
                CheckBoxSet(
                  filterBool: _filters['isKazi']!,
                  filterName: "Kazi Farmers",
                  onChange: (value) {
                    setState(() {
                      _filters['isKazi'] = value;
                    });
                  },
                ),
              ],
            ),
            KeellsButton(
              buttonName: 'Apply Filters',
              buttonColor: keellsColor,
              onSubmit: () {
                Navigator.pop(context, _filters);
              },
            ),
          ],
        ),
      ),
    );
  }
}
