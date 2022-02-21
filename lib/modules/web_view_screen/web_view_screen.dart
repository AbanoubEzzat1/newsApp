import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({required this.url});
  late final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
        centerTitle: true,
        actions: const [Icon(Icons.list)],
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
