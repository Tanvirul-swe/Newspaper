import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newspaper/Service/UnityAdd.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
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
    UnityAds.init(
      gameId: AdManager.gameId,
      testMode: false,
      listener: (state, args) => print('Init Listener: $state => $args'),
    );
    showAdds();
    super.initState();
  }

  showAdds() async {
    await UnityAds.showVideoAd(
      placementId: AdManager.interstitialVideoAdPlacementId,
      listener: (state, args) =>
          print('Interstitial Video Listener: $state => $args'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF140161),
        title: const Text('Read'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: const Color(0xFF140161),
      //   onPressed: () {
      //     setState(() {
      //       checkclick++;
      //       if (checkclick % 2 == 0) {
      //         setState(() {
      //           addfavorite = true;
      //           papername = widget.paper.toString();
      //         });
      //       } else {
      //         papername = '';
      //         setState(() {
      //           addfavorite = false;
      //         });
      //       }
      //     });
      //   },
      //   child: addfavorite == false
      //       ? const Icon(Icons.favorite_outline_rounded)
      //       : const Icon(Icons.favorite_outlined),
      // ),
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
         Align(
           alignment: Alignment.bottomCenter,
           child: UnityBannerAd(
             placementId: AdManager.bannerAdPlacementId,
             listener: (state, args) {
               print('Banner Listener: $state => $args');
             },
           ),
         )
        ],
      ),
    );
  }
}
