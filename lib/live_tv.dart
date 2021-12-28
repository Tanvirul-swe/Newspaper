import 'package:flutter/material.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/home_page.dart';
import 'package:newspaper/webview.dart';
class BDLiveTV extends StatelessWidget {
  const BDLiveTV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live TV'),
        centerTitle: true,
        backgroundColor: const Color(0xFF140161),
      ),
      body:  GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(tvchannel.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(BDLiveTvChannel[index])),
              );
            },
            child: Center(
              child: TvChannelCard(choiceTvChannel: livetvchannel[index]),
            ),
          );
        }),
      ),
    );
  }
}
