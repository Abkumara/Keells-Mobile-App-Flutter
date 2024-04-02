import 'package:flutter/material.dart';

import 'package:keellsapp/Data/dummydata.dart';
import 'package:keellsapp/Model/item.dart';
import 'package:keellsapp/Screens/filterScreen.dart';
import 'package:keellsapp/widegets/item_card.dart';

class SearchBarScreen extends StatefulWidget {
  const SearchBarScreen({Key? key}) : super(key: key);

  @override
  State<SearchBarScreen> createState() => _SearchBarScreenState();
}

class _SearchBarScreenState extends State<SearchBarScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Item> _items = dummyItems;
  List<Item> _searchItems = [];
  Map<String, bool> _filters = {
    'isEggs': false,
    'isNoodles': false,
    'isChips': false,
    'isFast': false,
    'isIndividuval': false,
    'isCola': false,
    'isIfad': false,
    'isKazi': false,
  };

  @override
  void initState() {
    _searchItems = _items;
    super.initState();
  }

  void _applyFilters(Map<String, bool> filters) async {
    final Map<String, bool>? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(initialFilters: filters),
      ),
    );
    if (result != null) {
      setState(() {
        _filters = result;
        _searchItems = _items.where((item) {
          return (!_filters['isEggs']! || item.isEggs) &&
              (!_filters['isNoodles']! || item.isNoodles) &&
              (!_filters['isChips']! || item.isChips) &&
              (!_filters['isFast']! || item.isFastFood) &&
              (!_filters['isIndividuval']! || item.isIndividuval) &&
              (!_filters['isCola']! || item.isCocacola) &&
              (!_filters['isIfad']! || item.isIfad) &&
              (!_filters['isKazi']! || item.isKazi);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchItems = _items
                            .where((item) => item.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Searching Store',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _searchItems = _items;
                          });
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.highlight_off_rounded),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(15),
                          right: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    _applyFilters(_filters);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 10 / 13,
                ),
                itemCount: _searchItems.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    item: _searchItems[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
