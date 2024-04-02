import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:keellsapp/Model/item.dart';

class FavoriteItemNotifier extends StateNotifier<List<Item>> {
  FavoriteItemNotifier() : super([]);
  bool toggleItemFavoriteStatus(Item item) {
    final itemsFavorite = state.contains(item);
    if (itemsFavorite) {
      state = state.where((element) => element.id != item.id).toList();
      return false;
    } else {
      state = [...state, item];
      return true;
    }
  }
}

final favoriteItemProvider =
    StateNotifierProvider<FavoriteItemNotifier, List<Item>>(
  (ref) => FavoriteItemNotifier(),
);
