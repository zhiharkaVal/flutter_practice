import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/seed_data.dart';

final mealsProvider = Provider((reference) {
  return seedMeals;
});
