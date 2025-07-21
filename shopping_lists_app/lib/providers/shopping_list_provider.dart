import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/seed_data.dart';

final shoppingListProvider = Provider((reference) {
  return groceryItems;
});
