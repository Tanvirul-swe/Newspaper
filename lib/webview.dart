import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newspaper/Service/UnityAdd.dart';
import 'package:unity_ads_plugin/unity_ads_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

String papername = 'ff';

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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    inititaload();
  }

  void inititaload()async{
    UnityAds.init(
        gameId: AdManager.gameId,
        testMode: false,
        onComplete: (){
          showAdds();
        },
        onFailed: (error, message){
          inititaload();
        }
    );
  }

  void showAdds()async{
    UnityAds.showVideoAd(
        placementId: AdManager.interstitialVideoAdPlacementId,
        onComplete: (placementId){
          inititaload();
        },

        onFailed: (placementId, error, message) {
          inititaload();
        },

        onStart: (placementId) {
          inititaload();
        },
        onClick: (placementId) {
          inititaload();
        },
        onSkipped: (placementId) {
          inititaload();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF140161),
        title: const Text('Read'),
      ),

      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.paper,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF140161),
                  ),
                )
              : Stack(
          ),
        ],
      ),
    );
  }
}
