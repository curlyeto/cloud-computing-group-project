import 'package:flutter/material.dart';
import 'package:webview_universal/webview_universal.dart';


class WebViewPage extends StatefulWidget {
  final String? url;
  final String? title;
  const WebViewPage({Key? key, this.url,this.title}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController webViewController = WebViewController();
  Future<void> task() async {
    await webViewController.init(
      context: context,
      uri: Uri.parse(widget.url!), setState: (void Function() fn) {  },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    task();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
      ),
      body: WebView(
        controller: webViewController,
      ),
    );

  }
}
