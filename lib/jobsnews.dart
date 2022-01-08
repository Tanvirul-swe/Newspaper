import 'package:flutter/material.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/home_page.dart';
import 'package:newspaper/webview.dart';

class JobsNews extends StatelessWidget {
  const JobsNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF140161),
        title: const Text('Jobs news'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(8),
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
        children: List.generate(jobsnews.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebviewPage(jobslink[index])),
              );
            },
            child: Center(
              child: Jobsnews(jobs: jobsnews[index],),
              // child: Text(data[_channelname[index]].toString()),
            ),
          );
        }),
      ),
    );
  }
}
