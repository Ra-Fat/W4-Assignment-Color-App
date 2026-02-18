import 'package:flutter/material.dart';
import '../../service/color_service.dart';
import './widget/color_tab.dart';

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: CardType.values.map((type) => ColorTap(type: type)).toList(),
      ),
    );
  }
}
