import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:keellsapp/Data/dummydata.dart';

final itemProvider = Provider((ref) {
  return dummyItems;
});
