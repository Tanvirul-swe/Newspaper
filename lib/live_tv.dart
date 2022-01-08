import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newspaper/constant/constant.dart';
import 'package:newspaper/home_page.dart';
import 'package:newspaper/webview.dart';
String star='';
class BDLiveTV extends StatefulWidget {
  const BDLiveTV({Key? key}) : super(key: key);

  @override
  State<BDLiveTV> createState() => _BDLiveTVState();
}

class _BDLiveTVState extends State<BDLiveTV> {

  CollectionReference users = FirebaseFirestore.instance.collection('BDLiveTv');
    final List<String> _channelname = [
    'somy',
    'gtv',
    'rtv',
    'ntv',
    'banglavisiontv',
    'jamunatv',
    'news24tv',
    'deshtv',
    'channeleaytv',
    'channel24tv',
    'atntv',
    'etv',
    '71tv',
    'channel9tv',
    'mytv',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live TV'),
        centerTitle: true,
        backgroundColor: const Color(0xFF140161),
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc('ntv').get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
             star = data['app_link'];
            return  GridView.count(
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
                            builder: (context) => WebviewPage(data[_channelname[index]].toString())),
                      );
                    },
                    child: Center(
                      child: TvChannelCard(choiceTvChannel: livetvchannel[index]),
                      // child: Text(data[_channelname[index]].toString()),
                    ),
                  );
                }),
              );
          }

          return const Center(child:  CircularProgressIndicator(color:  Color(0xFF140161),));
        },
      ),
      // body:  GridView.count(
      //   padding: const EdgeInsets.all(8),
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 4.0,
      //   mainAxisSpacing: 4.0,
      //   children: List.generate(tvchannel.length, (index) {
      //     return InkWell(
      //       onTap: () {
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => WebviewPage(BDLiveTvChannel[index])),
      //         );
      //       },
      //       child: Center(
      //         child: TvChannelCard(choiceTvChannel: livetvchannel[index]),
      //       ),
      //     );
      //   }),
      // ),
    );
  }
}
