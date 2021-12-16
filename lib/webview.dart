import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
String papername='ff';
class WebviewPage extends StatefulWidget {
    String paper;

    WebviewPage(this.paper);

    @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool addfavorite = false;
  int checkclick = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF140161),
        title: const Text('Read'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF140161),
        onPressed: () {
          setState(() {
            checkclick++;
            if(checkclick%2==0){
              setState(() {
                addfavorite = true;
                papername=widget.paper.toString();
              });
            }
            else {
             papername = '';
              setState(() {
                addfavorite = false;
              });
            }
          });
        },

        child: addfavorite==false? const Icon(Icons.favorite_outline_rounded):const Icon(Icons.favorite_outlined ),

      ),
      body: WebView(
        initialUrl: 'https://www.prothomalo.com',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
