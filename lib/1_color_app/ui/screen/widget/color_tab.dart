import 'package:flutter/material.dart';
import '../../../service/color_service.dart';


class ColorTap extends StatelessWidget {
  final CardType type;
  const ColorTap({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: colorService,
      builder: (context, _) {
        return GestureDetector(
          onTap: () => colorService.increment(type),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: type.color,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: ${colorService.getCount(type)}',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
