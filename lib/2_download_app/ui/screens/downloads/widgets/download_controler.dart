import 'package:flutter/material.dart';

class Ressource {
  final String name;
  final int size; // in MB

  Ressource({required this.name, required this.size});
}

enum DownloadStatus { notDownloaded, downloading, downloaded }

class DownloadController extends ChangeNotifier {
  DownloadController(this.ressource);

  // DATA
  Ressource ressource;
  DownloadStatus _status = DownloadStatus.notDownloaded;
  double _progress = 0.0; // 0.0 → 1.0

  // GETTERS
  DownloadStatus get status => _status;
  double get progress => _progress;

  // Icon changes based on status
  Icon get trailingIcon {
    return Icon(switch (status) {
      DownloadStatus.notDownloaded => Icons.download,
      DownloadStatus.downloading => Icons.downloading,
      DownloadStatus.downloaded => Icons.folder,
    });
  }

  // ACTIONS
  void startDownload() async {
    if (_status == DownloadStatus.downloading) return;

    _status = DownloadStatus.downloading;
    _progress = 0.0;
    notifyListeners();

    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 1000));
      _progress += 0.1;
      notifyListeners();
    }

    _status = DownloadStatus.downloaded;
    notifyListeners();
  }
}
