import 'package:flutter/material.dart';

class DownloadExample extends StatelessWidget {
  const DownloadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('this is button click')),
      body: ListView.separated(
          itemBuilder: (context, index) => DetailTile(title: 'App $index'),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 30),
    );
  }
}

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

class DetailTile extends StatelessWidget {
  final String title;
  const DetailTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: const FlutterLogo(size: 40),
      trailing: const DownLoadButton(),
    );
  }
}

class DownLoadButton extends StatefulWidget {
  const DownLoadButton({super.key});

  @override
  State<DownLoadButton> createState() => _DownLoadButtonState();
}

class _DownLoadButtonState extends State<DownLoadButton> {
  DownloadStatus status = DownloadStatus.notDownloaded;

  @override
  Widget build(BuildContext context) {
    late Widget child1 = const Text('hi');

    void onTapFuntion() {
      setState(() {
        switch (status) {
          case DownloadStatus.notDownloaded:
            status = DownloadStatus.fetchingDownload;
            child1 = const CircularProgressIndicator();
            break;
          default:
            break;
        }
      });
    }

    late Widget child = status == DownloadStatus.notDownloaded ||
            status == DownloadStatus.downloaded
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              status != DownloadStatus.notDownloaded ? 'Open' : 'Get',
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
          )
        : status == DownloadStatus.fetchingDownload
            ? const CircularProgressIndicator()
            : const SizedBox();
    return GestureDetector(
      onTap: onTapFuntion,
      child: child,
    );
  }
}
