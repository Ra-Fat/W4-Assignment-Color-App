import 'package:flutter/material.dart';

enum CardType {
  red(Colors.red),
  blue(Colors.blue);

  final Color color;
  const CardType(this.color);
}

class ColorService extends ChangeNotifier {
  
  // Map to track tap count for each CardType
  final Map<CardType, int> _counts = {
    for (final type in CardType.values)
     type: 0,
  };

  // Get count , read only
  Map<CardType, int> get counts => Map.unmodifiable(_counts);

  // get the specific card type count
  int getCount(CardType type) => _counts[type] ?? 0;

  // increment method
  void increment(CardType type) {
    _counts[type] = (_counts[type] ?? 0) + 1;
    notifyListeners();
  }
}

final colorService = ColorService();

