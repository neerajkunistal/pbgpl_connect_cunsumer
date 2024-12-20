import 'dart:io';

import 'package:customer_connect/utills/global_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String? payNow;
  String? pdf;
  InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();
  PullToRefreshController? pullToRefreshController;
  final urlController = TextEditingController();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  void initState() {
    super.initState();
    localData();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  localData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      payNow = pref.getString(GlobalConstants.payNow) ?? "";
      pdf = pref.getString(GlobalConstants.pdf) ?? "";
      print("payNow---> " + payNow!);
      print("pdf---> " + Uri.parse(pdf!).toString());
    });
  }

  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //  backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
        appBar: AppBar(
          title: Text("Pay Now"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
            child: Column(
          children: [
            (progress != 1.0)
                ? LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.green,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple))
                : Container(),
            Expanded(
              child: payNow == null
                  ? Center(child: Text("Loading..."))
                  : InAppWebView(
                      key: webViewKey,
                      initialUrlRequest: URLRequest(url: Uri.parse(payNow!)),
                      initialOptions: options,
                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        //  print(consoleMessage);
                      },
                    ),
            ),
          ],
        )));
  }
}
