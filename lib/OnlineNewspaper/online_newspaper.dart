import 'package:flutter/material.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/home_page.dart';
import 'package:newspaper/webview.dart';

class OnlinePaper extends StatefulWidget {
  const OnlinePaper({Key? key}) : super(key: key);

  @override
  _OnlinePaperState createState() => _OnlinePaperState();
}

class _OnlinePaperState extends State<OnlinePaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF140161),
        title: const Text('Online newspaper'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(onlinepaper.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(onlinenews[index])),
              );
            },
            child: Center(
              child: Onlinenews(onlineNewspaper: onlinepaper[index]),
              // child: Text(data[_channelname[index]].toString()),
            ),
          );
        }),
      ),
    );
  }
}
