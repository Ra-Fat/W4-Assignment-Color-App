import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  String? get subtitleText {
    if (controller.status == DownloadStatus.notDownloaded) return null;

    final percent = (controller.progress * 100).toStringAsFixed(1);
    final downloadedSize = (controller.progress * controller.ressource.size)
        .toStringAsFixed(1);

    return '$percent% completed - $downloadedSize of ${controller.ressource.size} MB';
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(controller.ressource.name),
            subtitle: subtitleText != null ? Text(subtitleText!) : null,
            trailing: GestureDetector(
              onTap: controller.startDownload,
              child: controller.trailingIcon,
            ),
          ),
        );
      },
    );
  }
}
