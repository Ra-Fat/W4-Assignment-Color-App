import 'package:flutter/material.dart';
import '../../providers/color_service_provider.dart';


class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: ListenableBuilder(
        listenable: colorService,
        builder: (builder, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: colorService.counts.entries.map((entry) {
                return Text(
                  'Number of ${entry.key} = ${entry.value}',
                  style: const TextStyle(fontSize: 18),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
